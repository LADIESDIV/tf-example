# ----------------------------------------------------------------------------------------------------------------------
# CREATE OR GET SA
# ----------------------------------------------------------------------------------------------------------------------
resource "google_service_account" "create_account" {
  for_each     = { for k, v in var.iam_members : k => v if v.creation && v.type == "sa" }
  account_id   = each.key
  display_name = "My Service Account ${each.key}"
  lifecycle {
    postcondition {
      condition     = can(regex("^.*-sa$", each.key)) == true
      error_message = "Not good name for service account"
    }
  }
}

data "google_service_account" "get_sa" {
  for_each   = { for k, v in var.iam_members : k => v if(v.creation == false && v.type == "sa") }
  account_id = each.key
  lifecycle {
    precondition {
      condition     = each.key != "tf-sa-635@lille-zenbox-adeo-2024.iam.gserviceaccount.com"
      error_message = "No change role for tf-sa service account"
    }
  }
}
