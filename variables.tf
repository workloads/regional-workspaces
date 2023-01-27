variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "csp_configuration" {
  type = list(object({
    name    = string
    prefix  = string
    enabled = bool
  }))

  description = "Project-wide List of Cloud Service Providers (CSPs)."

  # the default for this variable is set in `workloads/workspaces`
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
