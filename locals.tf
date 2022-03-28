locals {
  # Get ID of event bus resources
  this_event_bus_id = var.create_bus ? concat(alicloud_event_bridge_event_bus.bus.*.id, [""])[0] : var.event_bus_id
}