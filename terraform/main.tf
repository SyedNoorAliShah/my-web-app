terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "exam_rg" {
  name     = "devops-exam-rg"
  location = "East US"
}

resource "azurerm_container_group" "exam_app" {
  name                = "my-web-app"
  location            = azurerm_resource_group.exam_rg.location
  resource_group_name = azurerm_resource_group.exam_rg.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "my-web-app-noor"

  container {
    name   = "myapp"
    image  = "nooralishah270/my-web-app:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 3000
      protocol = "TCP"
    }
  }
}