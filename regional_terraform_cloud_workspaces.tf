module "regional_aws_workspaces" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset(data.aws_regions.main.names)

  source  = "ksatirli/regional-workspace/tfe"
  version = "1.0.0"

  region = {
    category   = "env"
    identifier = each.key
    prefix     = var.provider_prefixes.aws
    variable   = "AWS_REGION"
  }

  project_id        = tfe_project.regional_workspaces.id
  terraform_version = var.terraform_version
  tfe_organization  = var.tfe_organization

  # see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace#identifier
  vcs_repo = {
    identifier     = "${var.tfe_organization}/regional-aws-deployment"
    branch         = "main"
    oauth_token_id = var.tfe_oauth_client_id
  }
}
