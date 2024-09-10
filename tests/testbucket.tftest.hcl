run "create_bucket" {
  variables {
    list_bucket = [{
        "name"                     = "lille-zenbox-adeo-2024-test",
        "bucket_region"            = "europe-west1",
        "creation"                 = true,
        "path_delete_after_30_day" = ["test"]
        }]
    list_repository = ["test"]
    iam_members = {
  "test-sa" = {
    type       = "sa",
    creation   = true,
    globalrole = ["roles/cloudfunctions.admin"]
  }
}
  }

  # Check that the bucket name is correct
  assert {
    condition     = google_storage_bucket.bucket["lille-zenbox-adeo-2024-test"].name == "lille-zenbox-adeo-2024-test"
    error_message = "Invalid bucket name"
  }
}
