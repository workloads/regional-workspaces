variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "provider_prefixes" {
  type = object({
    aws          = string
    gcp          = string
    azure        = string
    digitalocean = string
  })

  description = "Provider-specific Prefix for Terraform Cloud Workspace (Including trailing dash)."

  default = {
    aws          = "aws"
    gcp          = "gcp"
    azure        = "az"
    digitalocean = "do"
  }
}

variable "terraform_version" {
  type        = string
  description = "Version of Terraform to use for Terraform Cloud."
}

variable "tfe_oauth_client_id" {
  type        = string
  description = "VCS Provider OAuth Client Identifier."
  sensitive   = true
}

variable "tfe_organization" {
  type        = string
  description = "Name of the Terraform Cloud Organization."
}
