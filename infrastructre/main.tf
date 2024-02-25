provider "azurerm" {
  features {}
   subscription_id = "d486b922-358a-4fd8-9887-d800ae394cbd"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "example" {
  name                = var.registry_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = var.registry_sku
  admin_enabled       = true
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

resource "azurerm_app_service" "exampleappaservice" {
  name                = var.app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.example.login_server}restapiapplication"
    always_on = true // Keep the container running continuously
  }

  app_settings = {
    DOCKER_REGISTRY_SERVER_URL     = "https://${azurerm_container_registry.example.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME = azurerm_container_registry.example.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD = azurerm_container_registry.example.admin_password
    WEBSITES_PORT                   = "5000" // Set 
  }

  https_only = true

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITES_PORT"]
    ]
  }
}
