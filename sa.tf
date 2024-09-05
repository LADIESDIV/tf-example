# ----------------------------------------------------------------------------------------------------------------------
# CREATE OR GET SA
# ----------------------------------------------------------------------------------------------------------------------
resource "google_service_account" "create_account" {
  for_each     = { for k, v in var.iam_members : k => v if v.creation && v.type == "sa" }
  account_id   = each.key
  display_name = "My Service Account ${each.key}"
}

data "google_service_account" "get_sa" {
  for_each   = { for k, v in var.iam_members : k => v if(v.creation == false && v.type == "sa") }
  account_id = each.key
}
