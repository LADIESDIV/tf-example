module "github_oidc" {
  count = var.list_oidc_repo != {} ? 0 : 1
  source  = "saidsef/github-oidc/gcp"
  version = ">= 1"

  project_id = var.project_id
  pool_id    = "github-action"

  repositories = var.list_oidc_repo
}
