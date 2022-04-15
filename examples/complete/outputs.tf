output "event_bus_id" {
  description = "The id of the event bridge event bus."
  value       = module.event_bridge_event_bus.event_bus_id
}

output "event_source_id" {
  description = "The resource ID in terraform of Event Source."
  value       = module.event_bridge_event_source.event_source_id
}

output "rule_id" {
  description = "The resource ID of Rule. "
  value       = module.event_bridge_rule.rule_id
}

output "service_linked_role_id" {
  description = "The id of the event bridge service linked role."
  value       = module.event_bridge_service_linked_role.service_linked_role_id
}