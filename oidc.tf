module "github_oidc" {
  source  = "saidsef/github-oidc/gcp"
  version = ">= 1"

  project_id = var.project_id
  pool_id    = "github-action"

  repositories = var.list_oidc_repo
}
