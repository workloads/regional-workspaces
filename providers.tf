# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  # AWS Region is required but irrelevant for the AWS Resources this repository interacts with.
  region = var.management_region_aws

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      "github:url"                 = "https://github.com/workloads/regional-workspaces"
      "hcp-terraform:organization" = var.tfe_organization
    }
  }
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  credentials = var.google_credentials
  project     = var.google_project_id

  # GCP Region is required but irrelevant for the GCP Resources this repository interacts with.
  region = var.management_region_gcp
}

# The HCP Terraform Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication
provider "tfe" {
  hostname        = "app.terraform.io"
  ssl_skip_verify = false
}

# The TFE Provider is set to retrieve configuration from `variables.tf` and the environment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
provider "tfe" {
  alias = "viewer"

  hostname        = "app.terraform.io"
  ssl_skip_verify = false
  token           = var.tfe_team_token_viewers
}
