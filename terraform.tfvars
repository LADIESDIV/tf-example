region     = "europe-west1"
project    = "xx"
project_id = "xx"
iam_members = {
  "cf-python-example-sa" = {
    type       = "sa",
    creation   = true,
    globalrole = ["roles/cloudfunctions.admin"]
  }
}

list_repository = ["cf-python-example"]

list_bucket = [{
  "name"                     = "xx-cf-python-example",
  "bucket_region"            = "europe-west1",
  "creation"                 = true,
  "role_members"             = { "roles/storage.objectAdmin" : ["cf-python-example-sa"] }
  "path_delete_after_30_day" = ["test"]
}]

list_oidc_repo = [{
  org_name   = "ladiesdiv"
  repository = "python-example"
}]
