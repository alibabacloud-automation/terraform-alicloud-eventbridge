
output "event_bus_id" {
  description = "The id of the event bridge event bus."
  value       = module.example.event_bus_id
}

output "event_source_id" {
  description = "The resource ID in terraform of Event Source."
  value       = module.example.event_source_id
}

output "rule_id" {
  description = "The resource ID of Rule. "
  value       = module.example.rule_id
}

output "service_linked_role_id" {
  description = "The id of the event bridge service linked role."
  value       = module.example.service_linked_role_id
}