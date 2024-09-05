locals {
  list_bucketrolename = distinct(flatten(
    [for l in var.list_bucket :
      [for k, v in l.role_members :
        [for m in v :
    "${l.name},${k},${m}"] if(l.role_members != {} || l.role_members != null)]]
  ))
  list_bucket_role_members = flatten([
    for l in local.list_bucketrolename :
    [for k, v in var.iam_members : v.type == "sa" ?
      "${split(",", l)[0]},${split(",", l)[1]},serviceAccount:${v.creation ?
        google_service_account.create_account[split(":", k)[0]].email :
      data.google_service_account.get_sa[split(":", k)[0]].email}" :
      "${split(",", l)[0]},${split(",", l)[1]},group:${k}" if split(",", l)[2] == k
    ]
  ])
}

resource "google_storage_bucket_iam_member" "role_bucket" {
  for_each = { for l in local.list_bucket_role_members : l => l if(local.list_bucket_role_members != [] || local.list_bucket_role_members != null) }
  bucket   = split(",", each.value)[0]
  role     = split(",", each.value)[1]
  member   = split(",", each.value)[2]
}
