# iam

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.global_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_storage_bucket_iam_member.role_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_members"></a> [iam\_members](#input\_iam\_members) | type : sa for service account or group, creation always false for group, globalrole is role that you wants (ex: roles/storage.admin). Key map in group mail or sa name. | <pre>map(object({<br>    type     = string<br>    creation = bool<br>  globalrole = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_list_bucket"></a> [list\_bucket](#input\_list\_bucket) | List bucket, write if it's creation or not. In role members map, add specific role to use bucket (ex roles/storage.admin) with list use can have this role (mail for group and sa name for sa). | <pre>list(object({<br>    name                     = string<br>    creation                 = bool<br>    bucket_region            = string<br>    role_members             = optional(map(list(string)))<br>    path_delete_after_30_day = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
