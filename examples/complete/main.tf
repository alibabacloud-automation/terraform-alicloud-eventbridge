data "alicloud_regions" "default" {
  current = true
}

data "alicloud_account" "default" {
}

module "mns_queue" {
  source = "terraform-alicloud-modules/mns-queue/alicloud"
  name   = "tf-testacc-mns-queue-2022"
}

module "event_bridge_event_bus" {
  source = "../.."

  #alicloud_event_bridge_event_bus
  create_bus = true

  event_bus_name  = "tf-testacc-event-bus"
  bus_description = var.bus_description

  #alicloud_event_bridge_event_source
  create_source = false

  #alicloud_event_bridge_rule
  create_rule = false

  #alicloud_event_bridge_service_linked_role
  create_role = false

}

module "event_bridge_event_source" {
  source = "../.."

  #alicloud_event_bridge_event_bus
  create_bus = false

  #alicloud_event_bridge_event_source
  create_source = true

  event_bus_id           = module.event_bridge_event_bus.event_bus_id
  event_source_name      = "tf-testacc-event-source"
  source_description     = var.source_description
  linked_external_source = var.linked_external_source
  external_source_type   = "MNS"
  external_source_config = {
    QueueName = module.mns_queue.queue_name
  }

  #alicloud_event_bridge_rule
  create_rule = false

  #alicloud_event_bridge_service_linked_role
  create_role = false

}

module "event_bridge_rule" {
  source = "../.."

  #alicloud_event_bridge_event_bus
  create_bus = false

  #alicloud_event_bridge_event_source
  create_source = false

  #alicloud_event_bridge_rule
  create_rule = true

  event_bus_id        = module.event_bridge_event_bus.event_bus_id
  rule_name           = "tf-testacc-rule"
  rule_description    = var.rule_description
  rule_filter_pattern = var.rule_filter_pattern
  rule_status         = var.rule_status
  target_id           = "tf-testacc-target"
  target_endpoint     = "acs:mns:${data.alicloud_regions.default.regions.0.id}:${data.alicloud_account.default.id}:queues/${module.mns_queue.queue_name}"
  target_type         = "acs.mns.queue"
  param_list = [
    {
      resource_key = "queue"
      form         = "CONSTANT"
      value        = "tf-testacc-value"
      template     = ""
    },
    {
      resource_key = "Body"
      form         = "ORIGINAL"
      value        = ""
      template     = ""
    },
    {
      form         = "CONSTANT"
      resource_key = "IsBase64Encode"
      value        = "true"
    }
  ]

  #alicloud_event_bridge_service_linked_role
  create_role = false

}

module "event_bridge_service_linked_role" {
  source = "../.."

  #alicloud_event_bridge_event_bus
  create_bus = false

  #alicloud_event_bridge_event_source
  create_source = false

  #alicloud_event_bridge_rule
  create_rule = false

  #alicloud_event_bridge_service_linked_role
  create_role = true

  product_name = "AliyunServiceRoleForEventBridgeSendToMNS"

}
