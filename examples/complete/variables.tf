#alicloud_event_bridge_event_bus
variable "bus_description" {
  description = "The description of event bus."
  type        = string
  default     = "tf-testacc-event-bus-description"
}

#alicloud_event_bridge_event_source
variable "source_description" {
  description = "The description of event source."
  type        = string
  default     = "tf-testacc-event-source-description"
}

variable "linked_external_source" {
  description = "Whether to connect to an external data source. Default value: false"
  type        = bool
  default     = false
}

#alicloud_event_bridge_rule
variable "rule_description" {
  description = "The description of event rule."
  type        = string
  default     = "tf-testacc-rule-description"
}

variable "rule_filter_pattern" {
  description = "The pattern to match interested events."
  type        = string
  default     = "{\"source\":[\"acs.ecs\"],\"type\":[\"ecs:Snapshot:CreateSnapshotCompleted\"]}"
}

variable "rule_status" {
  description = "Rule status, either Enable or Disable. Valid values: DISABLE, ENABLE."
  type        = string
  default     = "ENABLE"
}