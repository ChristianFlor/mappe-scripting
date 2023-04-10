# Archivo de configuración de Packer para crear una imagen personalizada de la VMSS zipkin_vmss en Azure

variable "azure_subscription_id" {}
variable "azure_tenant_id" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "resource_group_name" {}

source "azure-arm" "frontend_vm" {
  resource_group_name = var.resource_group_name
  storage_account_uri = "https://my-storage-account.blob.core.windows.net/my-container"
  os_type             = "Linux"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "16.04-LTS"
  image_version       = "latest"
}

build {
  sources = [
    "source.azure-arm.frontend_vm"
  ]

  provisioner "file" {
    source      = "provision/frontend.sh"
    destination = "/tmp/frontend.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/frontend.sh",
      "/tmp/frontend.sh"
    ]
  }
  # Configuración de la imagen de la VMSS
  /*post-processors {
    "azure-arm" {
      os_type               = "Linux"
      managed_image_name    = "log_processor_image"
      managed_image_rg_name = var.resource_group_name
      image_sku             = "Standard_F2"
      image_version         = "0.1.0"
      tags = {
        application = "log_processor"
      }
    }
  }*/

}
