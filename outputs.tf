output "aws_regions" {
  description = "Exported Values of `data.aws_regions.main`."
  value       = data.aws_regions.main
}

# TODO: rewrite loop
#output "regional_workspace_urls" {
#  description = "Regional Workspace URLs."
#
#  # iterate over Workspace Outputs
#  value = {
#    for workspace in module.regional_aws_workspaces.regional_workspace_urls : workspace.id => workspace.name
#  }
#}
