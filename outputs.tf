output "event_bus_id" {
  description = "The id of the event bridge event bus."
  value       = local.this_event_bus_id
}

output "event_source_id" {
  description = "The resource ID in terraform of Event Source."
  value       = concat(alicloud_event_bridge_event_source.source.*.id, [""])[0]
}

output "rule_id" {
  description = "The resource ID of Rule. "
  value       = concat(alicloud_event_bridge_rule.rule.*.id, [""])[0]
}

output "service_linked_role_id" {
  description = "The id of the event bridge service linked role."
  value       = concat(alicloud_event_bridge_service_linked_role.role.*.id, [""])[0]
}