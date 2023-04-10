variable "image_publisher" {
    type= string
    description = "The image publisher to use when deploying the virtual machine."
    default = "Canonical"
}
variable "image_offer" {
    type= string
    description = "The image offer to use when deploying the virtual machine."
    default = "UbuntuServer"
}
variable "image_sku" {
    type= string
    description = "The image SKU to use when deploying the virtual machine."
    default = "16.04-LTS"
}
variable "image_version" {
    type= string
    description = "The image version to use when deploying the virtual machine."
    default = "latest"
}
variable "location" {
    type= string
    description = "The location/region where the virtual machine should be created."
}
variable "managed_image_resource_group_name" {
    type= string
    description = "The name of the resource group in which the managed image is located."
}

variable "vm_size" {
    type= string
    description = "The size of the virtual machine."
    default = "Standard_F2"
}
