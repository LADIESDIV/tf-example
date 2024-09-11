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
| [google_storage_bucket_iam_member.role_bucket](https://registry.terraform.io/providers/hashicorp/google/5.43.1/docs/resources/storage_bucket_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | bucket, write if it's creation or not. In role members map, add specific role to use bucket (ex roles/storage.admin) with list use can have this role (mail for group and sa name for sa). | <pre>object({<br>    name                     = string<br>    creation                 = bool<br>    bucket_region            = string<br>    role_members             = optional(map(list(string)))<br>    path_delete_after_30_day = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_create_account"></a> [create\_account](#input\_create\_account) | n/a | `map(any)` | n/a | yes |
| <a name="input_get_sa"></a> [get\_sa](#input\_get\_sa) | n/a | `map(any)` | n/a | yes |
| <a name="input_iam_members"></a> [iam\_members](#input\_iam\_members) | type : sa for service account or group, creation always false for group, globalrole is role that you wants (ex: roles/storage.admin). Key map in group mail or sa name. | <pre>map(object({<br>    type       = string<br>    creation   = bool<br>    globalrole = optional(list(string))<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
