variable "EnvironmentName" {
  description = "Environment name"
}

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
  default     = "Standard"
}

variable "namespace_capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20"
  type        = number
  default     = 1
}

variable "eventhub_namespace" {
  description = "Name of EventHub NameSpace"
}

variable "eventhub_name" {
  description = "Name of EventHub"
}

variable "eventhub_partition_count" {
  type        = number
  description = "Partition count in eventhub"
}

variable "eventhub_message_retention" {
  type        = number
  description = "Message Retention for eventhub"
  default     = null
}

variable "auto_inflate" {
  description = "Is Auto Inflate enabled for the EventHub Namespace, and what is maximum throughput?"
  type = object({
    enabled                  = bool
    maximum_throughput_units = number
  })
  default = null
}