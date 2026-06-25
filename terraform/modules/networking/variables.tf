# terraform/modules/networking/variables.tf

variable "prefix" {
  description = "Short prefix used in all resource names"
  type        = string
  default     = "azshop"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type = object({
    gateway           = string
    aks_nodes         = string
    private_endpoints = string
    bastion           = string
  })
  default = {
    gateway           = "10.0.1.0/24"
    aks_nodes         = "10.0.4.0/22"   # /22 = 1022 IPs — AKS needs room for pods
    private_endpoints = "10.0.2.0/24"
    bastion           = "10.0.3.0/26"   # /26 minimum required by Azure Bastion
  }
}

variable "tags" {
  type = map(string)
  default = {
    project     = "azureshop"
    environment = "dev"
    managed_by  = "terraform"
  }
}