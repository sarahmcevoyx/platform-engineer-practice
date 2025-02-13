variable "storage_account_name" {
  description = "The name of the Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "tags" {
  description = "Tags to associate with the storage account"
  type        = map(string)
  default     = {}
}