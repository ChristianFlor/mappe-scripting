
source "azure-arm" "zipkin_vm" {
    communicator = "ssh"

    image_offer = var.image_offer
    image_publisher = var.image_publisher
    image_sku = var.image_sku
    image_version = var.image_version

    location = var.location
    
    managed_image_name = var.managed_image_resource_group_name
    managed_image_resource_group_name = var.managed_image_resource_group_name

    
    os_type             = "Linux"
    ssh_clear_authorized_keys = true
    ssh_disable_agent_forwarding = true

    use_azure_cli_auth = true
    vm_size = var.vm_size
}

build {
  name = "zipkin_vm_provision"

  sources = [
    "source.azure-arm.zipkin_vm"
  ]

  provisioner "file" {
    source      = "../provision/zipkin.sh"
    destination = "/tmp/zipkin.sh"
  }

  provisioner "shell" {
    inline = [
      "chmod +x /tmp/auth_api.sh",
      "/tmp/auth_api.sh"
    ]
  }

}
