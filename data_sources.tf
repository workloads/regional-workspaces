# get all currently enabled AWS Regions
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/regions
data "aws_regions" "main" {}

# The Terraform Provider for Azure does not currently support listing regions.
# See `./variables_azure_locations.json` and `./variables.tf` for more information.

# get all currently enabled GCP Regions
data "google_compute_regions" "main" {}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace
data "tfe_workspace" "main" {
  name         = "regional-workspaces"
  organization = var.tfe_organization
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace
data "tfe_workspace" "main" {
  name         = "regional-workspaces"
  organization = var.tfe_organization
}
