#alicloud_event_bridge_event_bus
variable "create_bus" {
  description = "Controls if event bus should be created"
  type        = bool
  default     = false
}

variable "event_bus_name" {
  description = "The name of event bus."
  type        = string
  default     = ""
}

variable "bus_description" {
  description = "The description of event bus."
  type        = string
  default     = ""
}

#alicloud_event_bridge_event_source
variable "create_source" {
  description = "Controls if event source should be created"
  type        = bool
  default     = false
}

variable "event_bus_id" {
  description = "The id of event bus.It will be ignored when create_bus = true"
  type        = string
  default     = ""
}

variable "event_source_name" {
  description = "The code name of event source."
  type        = string
  default     = ""
}

variable "source_description" {
  description = "The description of event source."
  type        = string
  default     = ""
}

variable "linked_external_source" {
  description = "Whether to connect to an external data source. Default value: false"
  type        = bool
  default     = false
}

variable "external_source_type" {
  description = "The type of external data source."
  type        = string
  default     = "MNS"
}

variable "external_source_config" {
  description = "The config of external source."
  type        = map(string)
  default     = {}
}

#alicloud_event_bridge_rule
variable "create_rule" {
  description = "Controls if bridge rule should be created"
  type        = bool
  default     = false
}

variable "rule_name" {
  description = "The name of event rule."
  type        = string
  default     = ""
}

variable "rule_description" {
  description = "The description of event rule."
  type        = string
  default     = ""
}

variable "rule_filter_pattern" {
  description = "The pattern to match interested events."
  type        = string
  default     = ""
}

variable "rule_status" {
  description = "Rule status, either Enable or Disable. Valid values: DISABLE, ENABLE."
  type        = string
  default     = "DISABLE"
}

variable "target_id" {
  description = "The ID of target."
  type        = string
  default     = ""
}

variable "target_endpoint" {
  description = "The endpoint of target."
  type        = string
  default     = ""
}

variable "target_type" {
  description = "The type of target."
  type        = string
  default     = ""
}

variable "param_list" {
  description = "A list of param."
  type        = list(map(string))
  default     = []
}

#alicloud_event_bridge_service_linked_role
variable "create_role" {
  description = "Controls if service linked role should be created"
  type        = bool
  default     = false
}

variable "product_name" {
  description = "The product name for SLR. "
  type        = string
  default     = "AliyunServiceRoleForEventBridgeSendToMNS"
}