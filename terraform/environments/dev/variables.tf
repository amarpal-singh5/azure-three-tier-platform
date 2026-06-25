variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for resources."
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
  default     = "three-tier"
}
