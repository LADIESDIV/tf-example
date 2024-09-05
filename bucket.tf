resource "google_storage_bucket" "bucket" {
  for_each                    = { for v in var.list_bucket : v.name => v if v.creation }
  name                        = each.key
  location                    = each.value.bucket_region
  storage_class               = "REGIONAL"
  uniform_bucket_level_access = true
  force_destroy               = true
  labels                      = { "project" : element(split("-", each.key), length(split("-", each.key)) - 1) }
  versioning {
    enabled = true
  }
  lifecycle_rule {
    condition {
      age            = 30
      matches_prefix = each.value.path_delete_after_30_day
    }
    action {
      type = "Delete"
    }
  }
  lifecycle_rule {
    condition {
      age = 36135
    }
    action {
      type = "Delete"
    }
  }
  lifecycle_rule {
    condition {
      num_newer_versions = 3
    }
    action {
      type = "Delete"
    }
  }


  cors {
    origin = ["*"]
    method = ["*"]
  }
}
