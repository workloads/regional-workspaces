# Terraform Cloud Workspace: `regional-workspaces`

> This directory manages the lifecycle of Regional (and provider-specific) Terraform Cloud Workspaces.

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace: `regional-workspaces`](#terraform-cloud-workspace--regional-workspaces)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

## Usage

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| terraform_version | Version of Terraform to use for Terraform Cloud. | `string` | yes |
| tfe_oauth_client_id | VCS Provider OAuth Client Identifier. | `string` | yes |
| tfe_organization | Name of the Terraform Cloud Organization. | `string` | yes |
| provider_prefixes | Provider-specific Prefix for Terraform Cloud Workspace. | <pre>object({<br>    aws          = string<br>    gcp          = string<br>    azure        = string<br>    digitalocean = string<br>  })</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_regions | Exported Values of `data.aws_regions.main`. |
<!-- END_TF_DOCS -->

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/workloads/regional-workspaces/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
