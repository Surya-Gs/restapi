variable "resource_group_name" {
  description = "Name of the resource group"
  default="eus-rsg-dev"
}

variable "location" {
  description = "Azure region where the resources will be provisioned"
  default = "East us"
}

variable "registry_name" {
  description = "Name of the Azure Container Registry"
  default = "eusacrdev"
}

variable "registry_sku" {
  description = "SKU for the Azure Container Registry"
  default = "Basic"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  default = "eusappsvcplan"
}

variable "app_service_plan_tier" {
  description = "Tier of the App Service Plan"
  default = "Basic"
}

variable "app_service_plan_size" {
  description = "Size of the App Service Plan"
  default = "B1"
}

variable "app_service_name" {
  description = "Name of the App Service"
  default = "eusappsvcrestapi"
}

variable "docker_image" {
  description = "Name of the Docker image to be deployed"
  default = "restapiflask"
}

variable "login_server" {
  description = "URL for login server"
  default = "eusacrdev.azurecr.io"
  sensitive   = true
}