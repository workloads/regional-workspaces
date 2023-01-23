# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project
resource "tfe_project" "regional_workspaces" {
  organization = var.tfe_organization
  name         = "Regionals"
}
