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
    # see https://registry.terraform.io/providers/hashicorp/aws/5.38.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.38.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/azurerm/3.93.0/
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.93.0, < 4.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/google/5.17.0/
    google = {
      source  = "hashicorp/google"
      version = ">= 5.17.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.52.0/
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.52.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  # and https://github.com/workloads/.github/blob/main/VERSIONING.md#terraform-core
  required_version = ">= 1.7.0, < 2.0.0"
}
