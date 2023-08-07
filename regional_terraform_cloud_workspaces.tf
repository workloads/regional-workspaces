module "regional_aws_workspaces" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset(data.aws_regions.main.names)

  source  = "ksatirli/regional-workspace/tfe"
  version = "1.0.0"

  region = {
    category   = "env"
    identifier = each.key
    prefix     = local.csp_configuration["aws"].prefix
    variable   = "AWS_REGION"
  }

  project_id        = tfe_project.regional_workspaces["aws"].id
  terraform_version = var.terraform_version
  tfe_organization  = var.tfe_organization

  # see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace#identifier
  vcs_repo = {
    identifier     = "${var.tfe_organization}/regional-aws-deployment"
    branch         = "main"
    oauth_token_id = var.tfe_oauth_client_id
  }
}

module "regional_gcp_workspaces" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset(data.google_compute_regions.main.names)

  source  = "ksatirli/regional-workspace/tfe"
  version = "1.0.0"

  region = {
    category   = "env"
    identifier = each.key
    prefix     = local.csp_configuration["gcp"].prefix
    variable   = "GOOGLE_REGION"
  }

  project_id        = tfe_project.regional_workspaces["gcp"].id
  terraform_version = var.terraform_version
  tfe_organization  = var.tfe_organization

  # see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace#identifier
  vcs_repo = {
    # TODO: change to gcp
    identifier     = "${var.tfe_organization}/regional-aws-deployment"
    branch         = "main"
    oauth_token_id = var.tfe_oauth_client_id
  }
}
