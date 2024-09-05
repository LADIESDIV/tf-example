# TF-EXAMPLE

## Description

Installation de l'infra

## Utilisation terraform

Implémentation :
- création bucket avec rôle (qui y accède avec quel rôle, d'abord la création du sa avec apply puis l'ajout des rôle sur le bucket)
- création service account (sa) et ajout rôle aux différents users (groupe, sa, sa autres projets gcp) --> d'abord un apply pour créer le sa puis un autre apply pour lui ajouter un/des rôle(s)
- création repo docker
Pour utiliser une de ses implémentations, allez dans terraform.tfvars et ajouter dans la variable qui convient ce que vous avez besoin.

<!--- BEGIN_TF_DOCS --->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_members"></a> [iam\_members](#input\_iam\_members) | type : sa for service account or group, creation always false for group, globalrole is role that you wants (ex: roles/storage.admin). Key map in group mail or sa name. | <pre>map(object({<br>    type       = string<br>    creation   = bool<br>    globalrole = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_list_bucket"></a> [list\_bucket](#input\_list\_bucket) | List bucket, write if it's creation or not. In role members map, add specific role to use bucket (ex roles/storage.admin) with list use can have this role (mail for group and sa name for sa). | <pre>list(object({<br>    name                     = string<br>    creation                 = bool<br>    bucket_region            = string<br>    role_members             = optional(map(list(string)))<br>    path_delete_after_30_day = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_list_oidc_repo"></a> [list\_oidc\_repo](#input\_list\_oidc\_repo) | List repo with oidc for gcp. | <pre>list(object({<br>    org_name   = string<br>    repository = string<br>  }))</pre> | n/a | yes |
| <a name="input_list_repository"></a> [list\_repository](#input\_list\_repository) | List docker repo. | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project id | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region name | `string` | `"europe-west1"` | no |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bucket_sa_role"></a> [bucket\_sa\_role](#module\_bucket\_sa\_role) | ./iam | n/a |
| <a name="module_github_oidc"></a> [github\_oidc](#module\_github\_oidc) | saidsef/github-oidc/gcp | >= 1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.13.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 5.13.0 |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.13.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 5.13.0 |
## Resources

| Name | Type |
|------|------|
| [google-beta_google_artifact_registry_repository.repository](https://registry.terraform.io/providers/hashicorp/google-beta/5.13.0/docs/resources/google_artifact_registry_repository) | resource |
| [google_service_account.create_account](https://registry.terraform.io/providers/hashicorp/google/5.13.0/docs/resources/service_account) | resource |
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/5.13.0/docs/resources/storage_bucket) | resource |
<!--- END_TF_DOCS --->
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
