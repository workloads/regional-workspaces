# get all currently enabled AWS Regions
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/regions
data "aws_regions" "main" {}

# The Terraform Provider for Azure does not currently support listing regions.
# See `./variables_azure_locations.json` and `./variables.tf` for more information.

# get all currently enabled GCP Regions
data "google_compute_regions" "main" {}
