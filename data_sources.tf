# get all currently enabled AWS Regions
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/regions
data "aws_regions" "main" {}
