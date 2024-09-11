# ----------------------------------------------------------------------------------------------------------------------
# ADD GLOBAL ROLE
# ----------------------------------------------------------------------------------------------------------------------

locals {
  list_globalrole_members = compact(flatten([
    for l in var.globalrole :
    var.type == "sa" ?
    "${l},serviceAccount:${var.create_account != null ? var.create_account[var.sa].email : var.get_sa[var.sa].email}" :
    var.type == "saHorsProject" ?
    "${l},serviceAccount:${var.sa}" :
    "${l},group:${var.sa}"]
  ))
}

resource "google_project_iam_member" "global_role" {
  for_each = { for l in local.list_globalrole_members : l => l if(length(local.list_globalrole_members) == 0 || local.list_globalrole_members != null) }
  project  = var.project
  role     = split(",", each.value)[0]
  member   = split(",", each.value)[1]
}
