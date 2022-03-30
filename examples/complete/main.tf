
module "mns-queue" {
  source = "terraform-alicloud-modules/mns-queue/alicloud"
  name   = local.queue_name
}

resource "random_uuid" "default" {}

data "alicloud_account" "default" {}

locals {
  uuid            = substr("${replace(random_uuid.default.result, "-", "")}", 0, 6)
  queue_name      = "tf-test${local.uuid}"
  target_endpoint = "acs:mns:cn-beijing:${data.alicloud_account.default.id}:queues/${local.queue_name}"
}

module "example" {
  source                 = "../.."
  #alicloud_event_bridge_event_bus
  create_bus             = true
  event_bus_name         = "tf-busname${local.uuid}"
  bus_description        = var.bus_description
  #alicloud_event_bridge_event_source
  create_source          = false
  event_source_name      = "tfsource${local.uuid}"
  source_description     = var.source_description
  linked_external_source = var.linked_external_source
  external_source_type   = var.external_source_type
  external_source_config = {
    QueueName = local.queue_name
  }
  #alicloud_event_bridge_rule
  create_rule            = true
  rule_name              = "tf-rulename${local.uuid}"
  rule_description       = var.rule_description
  rule_filter_pattern    = var.rule_filter_pattern
  rule_status            = var.rule_status
  target_id              = "tf-test"
  target_endpoint        = local.target_endpoint
  target_type            = var.target_type
  param_list = [
    {
    resource_key  = "queue"
    form          = "CONSTANT"
    value         = local.queue_name
    template      = null
    },
    {
      resource_key = "Body"
      form         = "ORIGINAL"
      value        = ""
      template     = ""
    },
    {
      resource_key = "IsBase64Encode"
      form         = "CONSTANT"
      value        = "true"
      template     = ""
    }
  ]
  
  #alicloud_event_bridge_service_linked_role
  create_role            = true
  product_name           = "AliyunServiceRoleForEventBridgeSendToMNS"
}