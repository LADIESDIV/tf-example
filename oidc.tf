# Identiy pool for GitHub action based identity's access to Google Cloud resources
resource "google_iam_workload_identity_pool" "github_pool" {
  for_each                  = var.oidc
  provider                  = google-beta
  workload_identity_pool_id = each.key
}

# Configuration for GitHub identiy provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  for_each                           = var.oidc
  provider                           = google-beta
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool[each.key].workload_identity_pool_id
  workload_identity_pool_provider_id = each.value.list_oidc_repo[0].provider_id
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.aud"        = "assertion.aud"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri        = "https://token.actions.githubusercontent.com"
    allowed_audiences = []
  }
}

# IAM policy bindings to the service account resources created by GitHub identify
resource "google_service_account_iam_member" "pool_impersonation" {
  for_each           = var.oidc
  provider           = google-beta
  service_account_id = can(google_service_account.create_account[each.value.list_oidc_repo[0].sa]) ? google_service_account.create_account[each.value.list_oidc_repo[0].sa].id : data.google_service_account.get_sa[each.value.list_oidc_repo[0].sa].id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool[each.key].name}/attribute.repository/${each.value.list_oidc_repo[0].org_name}/${each.value.list_oidc_repo[0].repository}"
}
