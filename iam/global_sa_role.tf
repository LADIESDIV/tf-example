# ----------------------------------------------------------------------------------------------------------------------
# ADD GLOBAL ROLE
# ----------------------------------------------------------------------------------------------------------------------

locals {
  list_globalrole = distinct(flatten(
    [for k, v in var.iam_members :
    v.globalrole == null ? [] : v.globalrole]
  ))
  list_globalrole_members = compact(flatten([
    for l in local.list_globalrole :
    [for k, v in var.iam_members : v.globalrole != null ?
      contains(v.globalrole, l) ?
      v.type == "sa" ?
      "${l},serviceAccount:${v.creation ? google_service_account.create_account[split(":", k)[0]].email : data.google_service_account.get_sa[split(":", k)[0]].email}" :
      v.type == "saHorsProject" ?
      "${l},serviceAccount:${k}" :
      "${l},group:${k}" :
      "" :
    ""]
  ]))
}

resource "google_project_iam_member" "global_role" {
  for_each = { for l in local.list_globalrole_members : l => l if(local.list_globalrole_members != [] || local.list_globalrole_members != null) }
  project  = var.project
  role     = split(",", each.value)[0]
  member   = split(",", each.value)[1]
}
