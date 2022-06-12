variable "region" {
  description = "Region for Resource Group where resource to be deployed"
}

variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "eventhub_namespace_name" {
  description = "Name of EventHub namespace"
}

variable "sku" {
  description = "Defines instance tier to use. Valid options are Basic and Standard."
  default = "Standard"
}

variable "namespace_capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20"
  type        = number
  default     = 1
}

variable "enviornment_name" {
  description = "Environment name"
}

variable "eventhub_name" {
  description = "Name of EventHub"
}

variable "eventhub_partition_count" {
  description = "Partition count in eventhub"
}

variable "eventhub_message_retention" {
  description = "Message Retention for eventhub"
}

variable "auto_inflate" {
  description = "Is Auto Inflate enabled for the EventHub Namespace, and what is maximum throughput?"
  type = object({
    enabled                  = bool
    maximum_throughput_units = number
  })
  default = null
}

variable "diagnostics" {
  description = "Diagnostic settings for those resources that support it. See README.md for details on configuration."
  type = object({
    destination   = string
    eventhub_name = string
    logs          = list(string)
    metrics       = list(string)
  })
  default = null
}

variable "network_rules" {
  description = "Network rules restricting access to the event hub."
  type = object({
    ip_rules   = list(string)
    subnet_ids = list(string)
  })
  default = null
}


variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
