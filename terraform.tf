terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/cloud
  cloud {
    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "regional-workspaces"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.64.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.64.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.1, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/google/6.0.1
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.1, < 7.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.58.1
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.58.1, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  # and https://github.com/workloads/.github/blob/main/VERSIONING.md#terraform-core
  required_version = ">= 1.9.0, < 2.0.0"
}
