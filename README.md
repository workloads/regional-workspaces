# HCP Terraform Workspace `regional-workspaces`

> This repository manages regional (and provider-specific) HCP Terraform Workspaces for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [HCP Terraform Workspace `regional-workspaces`](#hcp-terraform-workspace-regional-workspaces)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Diagrams](#diagrams)
    * [HCP Terraform Workspace Structure](#hcp-terraform-workspace-structure)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
    * [Updating Azure Regions File](#updating-azure-regions-file)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- HCP Terraform [Account](https://app.terraform.io/session)
- HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Diagrams

This section contains an overview of (simplified) diagrams, describing the logical connections of the individual HCP Terraform Workspaces.
All diagrams are expressed in [Mermaid](https://mermaid.js.org) syntax.

### HCP Terraform Workspace Structure

This diagram describes the [HCP Terraform Workspaces](https://developer.hashicorp.com/terraform/cloud-docs/workspaces) structure:

```mermaid
flowchart TD
  seed_workspace["HCP Terraform Workspace `regional-workspaces`"]
  seed_workspace --- csp_configuration["CSP Configuration Object"]

  %% Cloud Service Providers
  csp_configuration --- aws(("AWS"))
  csp_configuration --- azure(("Azure"))
  csp_configuration --- google(("GCP"))
  csp_configuration --- others(("other CSPs"))

  %% Regional Operations
  workspace["per-region TFC Workspace"]

  aws    --- workspace
  azure  --- workspace
  google --- workspace
  others --- workspace

  workspace --- nomad_agent["per-AZ Nomad Agent(s)"]

  %% Styling
  classDef workspace color: #ffffff, fill: #844FBA, stroke: #844FBA
  class seed_workspace workspace;
  class workspace workspace;

  style csp_configuration color: #ffffff, stroke: #844FBA

  style aws    color: #000000, fill: #ff9900, stroke: #ff9900
  style azure  color: #ffffff, fill: #008ad7, stroke: #008ad7
  style google color: #000000, fill: #db4437, stroke: #db4437
  style others color: #ffffff, fill: #282433, stroke: #282433

  style nomad_agent color: #000000, fill: #60dea9, stroke: #60dea9
```

## Usage

The `regional-workspaces` HCP Terraform Workspace acts as a bootstrapper for CSP-specific and regional HCP Terraform Workspaces.

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

Additional workflows are available through a [Makefile](./Makefile).

Running `make` without commands will print out the following help information:

```text
🌐 REGIONAL HCP TERRAFORM WORKSPACES

Target                        Description                                                  Usage
get-az-subscription           get Azure Subscription to currently logged-in Account        `make get-az-subscription`
set-az-subscription           set Azure CLI Subscription to currently logged-in Account    `make set-az-subscription`
create-az-service-principal   create Azure Service Principal                               `make create-az-service-principal`
list-az-locations             retrieve and format a list of available Azure Locations      `make list-az-locations update_file=true`
help                          display a list of Make Targets                               `make help`
_listincludes                 list all included Makefiles and *.mk files                   `make _listincludes`
_selfcheck                    lint Makefile                                                `make _selfcheck`
```

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| csp_configuration | Project-wide List of Cloud Service Providers (CSPs). | <pre>list(object({<br>    name    = string<br>    prefix  = string<br>    enabled = bool<br>  }))</pre> | yes |
| google_credentials | The credentials to use for authenticating with GCP. | `string` | yes |
| google_project_id | The Project ID to use for authenticating with GCP. | `string` | yes |
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| management_region_gcp | Google-specific `Management` Region Identifier. | `string` | yes |
| terraform_version | Version of Terraform to use for HCP Terraform. | `string` | yes |
| tfe_oauth_client_id | VCS Provider OAuth Client Identifier. | `string` | yes |
| tfe_organization | Name of HCP Terraform Organization. | `string` | yes |

### Outputs

| Name | Description |
|------|-------------|
| aws_regions | Exported Values of `data.aws_regions.main`. |
| aws_workspace_urls | AWS-specific Regional Workspace URLs. |
| csp_configuration | Exported value of `local.csp_configuration`. |
| google_regions | Exported Values of `data.google_compute_regions.main`. |
<!-- END_TF_DOCS -->

## Notes

### Updating Azure Regions File

The Azure Regions file ([`./variables_azure_locations.json`](./variables_azure_locations.json)) can be updated by executing the `list-az-locations` target while setting the `update_file` flag to `true`:

```shell
make list-az-locations update_file=true
```

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/regional-workspaces/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
