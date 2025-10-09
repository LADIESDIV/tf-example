region  = "europe-west1"
project = "xx"
#project_id = "xx"
iam_members = {
  "cf-python-example-sa" = {
    type       = "sa",
    creation   = true,
    globalrole = ["roles/run.admin", "roles/artifactregistry.writer", "roles/iam.serviceAccountUser"]
  },
  # "sa@xx.iam.gserviceaccount.com" = {
  #   type       = "sa",
  #   creation   = false,
  #   globalrole = ["roles/cloudfunctions.admin"]
  # }
}

list_repository = ["cf-python-example"]

list_bucket = [{
  "name"                     = "xx-cf-python-example",
  "bucket_region"            = "europe-west1",
  "creation"                 = true,
  "role_members"             = { "roles/storage.objectAdmin" : ["cf-python-example-sa"] }
  "path_delete_after_30_day" = ["test"]
}]

oidc = { "github-action-sandbox-ldy" : { "list_oidc_repo" : [{
  org_name    = "LADIESDIV"
  repository  = "python-example"
  provider_id = "github-provider"
  sa          = "cf-python-example-sa"
}] } }

bdd = {
  bdd-example = {
    version = "POSTGRES_15"
  }
}
