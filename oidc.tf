module "github_oidc" {
  for_each = var.oidc
  source   = "saidsef/github-oidc/gcp"
  version  = ">= 1"

  project_id = var.project_id
  pool_id    = each.key

  repositories = each.value.list_oidc_repo
}
