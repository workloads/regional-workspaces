terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://app.terraform.io/app/workloads/workspaces
    # and https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://app.terraform.io/app/workloads/regional-workspaces
    # and https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "regional-workspaces"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.25.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/azurerm/3.80.0/
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80.0, < 4.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/google/5.5.0/
    google = {
      source  = "hashicorp/google"
      version = ">= 5.5.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.50.0/
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.50.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  # and https://github.com/workloads/.github/blob/main/VERSIONING.md#terraform-core
  required_version = ">= 1.6.0, < 2.0.0"
}
