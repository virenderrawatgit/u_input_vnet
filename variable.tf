variable "userinput" {
  description = "Enter the total vnet going to create"
  type        = number
}
variable "base_vnet_name" {
  description = "Prefix for VNet names"
  type        = string
  default     = "myvnet"
}

variable "address_space_base" {
  description = "Base address space prefix"
  type        = string
  default     = "10"
}

variable "virender" {
  
}