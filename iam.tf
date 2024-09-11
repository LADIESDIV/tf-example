module "sa_role" {
  for_each       = { for k, v in var.iam_members : k => v if length(v.globalrole) != 0 }
  source         = "./iam_global"
  project        = var.project
  globalrole     = each.value.globalrole
  sa             = each.key
  type           = each.value.type
  get_sa         = each.value.creation == false ? data.google_service_account.get_sa : null
  create_account = each.value.creation == true ? google_service_account.create_account : null
  depends_on     = [data.google_service_account.get_sa, google_service_account.create_account]
}

module "bucket_role" {
  for_each       = { for v in var.list_bucket : index(var.list_bucket, v) => v if length(v.role_members) != 0 }
  source         = "./iam_bucket"
  iam_members    = var.iam_members
  bucket         = var.list_bucket[each.key]
  get_sa         = data.google_service_account.get_sa
  create_account = google_service_account.create_account
  depends_on     = [data.google_service_account.get_sa, google_storage_bucket.bucket, google_service_account.create_account]
}
