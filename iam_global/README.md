# iam

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.43.1 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 5.43.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.43.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.global_role](https://registry.terraform.io/providers/hashicorp/google/5.43.1/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_account"></a> [create\_account](#input\_create\_account) | n/a | `map(any)` | n/a | yes |
| <a name="input_get_sa"></a> [get\_sa](#input\_get\_sa) | n/a | `map(any)` | n/a | yes |
| <a name="input_globalrole"></a> [globalrole](#input\_globalrole) | list role | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project id | `string` | n/a | yes |
| <a name="input_sa"></a> [sa](#input\_sa) | mail sa | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | type member | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
