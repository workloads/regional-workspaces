variable "csp_configuration" {
  type = list(object({
    name    = string
    prefix  = string
    enabled = bool
  }))

  description = "Project-wide List of Cloud Service Providers (CSPs)."

  # the default for this variable is set in `workloads/workspaces`
}

variable "google_credentials" {
  type        = string
  description = "The credentials to use for authenticating with GCP."
}

variable "google_project_id" {
  type        = string
  description = "The Project ID to use for authenticating with GCP."
}

variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "management_region_gcp" {
  type        = string
  description = "Google-specific `Management` Region Identifier."
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
  description = "Name of Terraform Cloud Organization."
}

locals {
  # load list of Azure Locations from get all currently enabled Azure Locations
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/extended_locations
  azure_locations = jsondecode(file("./variables_azure_locations.json"))

  csp_configuration_full = var.csp_configuration

  # selective CSP Configuration, only contains `enabled` providers
  # assigning `value` as the full value of each object results in duplication of `value.prefix` in the output
  # but it allows for easier consumption of the `value.prefix` because it foregoes approaches such as `keys()`
  csp_configuration = tomap({
    for value in local.csp_configuration_full :
    value.prefix => value
    if value.enabled == true
  })
}
