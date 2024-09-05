resource "google_artifact_registry_repository" "repository" {
  for_each      = { for l in var.list_repository : l => l }
  provider      = google-beta
  format        = "DOCKER"
  repository_id = each.value
  location      = var.region
  project       = var.project
  labels        = { "project" : each.value }
  cleanup_policies {
    id     = "keep version"
    action = "KEEP"
    condition {
      tag_state             = "ANY"
      tag_prefixes          = ["dev"]
      package_name_prefixes = [each.value]
    }
  }
  cleanup_policies {
    id     = "delete snapshot"
    action = "DELETE"
    condition {
      tag_state  = "ANY"
      older_than = "60000s"
    }
  }
  cleanup_policy_dry_run = true
}
