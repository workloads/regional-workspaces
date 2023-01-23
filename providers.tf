# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  # AWS Region is required but irrelevant for the AWS Resources this repository interacts with.
  region = var.management_region_aws

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      "github:url"                   = "https://github.com/workloads/regional-workspaces"
      "terraform-cloud:organization" = var.tfe_organization
    }
  }
}

# The Terraform Cloud Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication
provider "tfe" {}
