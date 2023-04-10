# see https: //www. packer. io/docs/templates/hcl_templates/blocks/packer

packer {
# see https: //www. packer. io/docs/templates/hcl_templates/blocks/packer#version-constraint-syntax
required_version = ">= 1.7.6"

# see https: //github. com/hashicorp/packer-plugin-azure/releases/
    required_plugins {
        azure = {
            version = ">= 1.4.1"
            source  = "github.com/hashicorp/azure"
        }
    }
}