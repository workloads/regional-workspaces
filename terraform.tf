terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "regional-workspaces"
    }
  }

    # see https://registry.terraform.io/providers/hashicorp/aws/4.51.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.51.0, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.41.0/
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.41.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.3.0"
}
