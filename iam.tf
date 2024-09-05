module "bucket_sa_role" {
  source      = "./iam"
  iam_members = var.iam_members
  project     = var.project
  list_bucket = var.list_bucket
  depends_on  = [google_storage_bucket.bucket, google_service_account.create_account]
}
