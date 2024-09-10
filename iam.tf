module "bucket_sa_role" {
  count          = var.iam_members != {} ? 0 : 1
  source         = "./iam"
  iam_members    = var.iam_members
  project        = var.project
  list_bucket    = var.list_bucket
  get_sa         = data.google_service_account.get_sa
  create_account = google_service_account.create_account
  depends_on     = [data.google_service_account.get_sa, google_storage_bucket.bucket, google_service_account.create_account]
}
