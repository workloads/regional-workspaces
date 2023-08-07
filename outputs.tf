output "csp_configuration" {
  description = "Exported value of `local.csp_configuration`."
  value       = local.csp_configuration
}

#output "aws_regions" {
#  description = "Exported Values of `data.aws_regions.main`."
#  value       = data.aws_regions.main
#}

output "aws_workspace_urls" {
  description = "AWS-specific Regional Workspace URLs."

  # iterate over Workspace Outputs
  value = {
    for workspace in module.regional_aws_workspaces : workspace.tfe_workspace.name => workspace.tfe_workspace.html_url
  }
}

#
#  # iterate over Workspace Outputs
#  value = {
#    for workspace in module.regional_aws_workspaces.regional_workspace_urls : workspace.id => workspace.name
#  }
#}

#output "google_regions" {
#  description = "Exported Values of `data.google_compute_regions.main`."
#  value       = data.google_compute_regions.main
#}

output "google_workspace_urls" {
  description = "Google Cloud-specific Regional Workspace URLs."

  # iterate over Workspace Outputs
  value = {
    for workspace in module.regional_google_workspaces : workspace.tfe_workspace.name => workspace.tfe_workspace.html_url
  }
}
