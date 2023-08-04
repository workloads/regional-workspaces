# create Regional Workspaces for each (enabled) CSP
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project
resource "tfe_project" "regional_workspaces" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = {
    for identifier, provider in local.csp_configuration : identifier => provider
  }

  organization = var.tfe_organization
  name         = "Regional - ${upper(each.value.prefix)}"
}
