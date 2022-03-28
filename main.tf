
resource "alicloud_event_bridge_event_bus" "bus" {
  count          = var.create_bus ? 1 : 0
  event_bus_name = var.event_bus_name
  description    = var.bus_description
}

resource "alicloud_event_bridge_event_source" "source" {
  count                  = var.create_source ? 1 : 0
  event_bus_name         = local.this_event_bus_id
  event_source_name      = var.event_source_name
  description            = var.source_description
  linked_external_source = var.linked_external_source
  external_source_type   = var.external_source_type
  external_source_config = {
    QueueName       = lookup(var.external_source_config, "QueueName", null)
    RegionId        = lookup(var.external_source_config, "RegionId", null)
    InstanceId      = lookup(var.external_source_config, "InstanceId", null)
    VirtualHostName = lookup(var.external_source_config, "VirtualHostName", null)
    Topic           = lookup(var.external_source_config, "Topic", null)
    Offset          = lookup(var.external_source_config, "Offset", null)
    GroupID         = lookup(var.external_source_config, "GroupID", null)
  }
}

resource "alicloud_event_bridge_rule" "rule" {
  count          = var.create_rule ? 1 : 0
  event_bus_name = local.this_event_bus_id
  rule_name      = var.rule_name
  description    = var.rule_description
  filter_pattern = var.rule_filter_pattern
  status         = var.rule_status
  targets {
    target_id = var.target_id
    endpoint  = var.target_endpoint
    type      = var.target_type
    dynamic "param_list" {
      for_each        = var.param_list
      content {
        resource_key  = param_list.value["resource_key"]
        form          = param_list.value["form"]
        value         = param_list.value["value"]
        template      = param_list.value["template"]
      }
    }
  }
}

resource "alicloud_event_bridge_service_linked_role" "role" {
  count        = var.create_role ? 1 : 0
  product_name = var.product_name
}