variable "project" {
  type        = string
  description = "Project id"
}

variable "iam_members" {
  type = map(object({
    type     = string
    creation = bool
  globalrole = optional(list(string))
  }))
  description = "type : sa for service account or group, creation always false for group, globalrole is role that you wants (ex: roles/storage.admin). Key map in group mail or sa name."
}

variable "list_bucket" {
  type = list(object({
    name                     = string
    creation                 = bool
    bucket_region            = string
    role_members             = optional(map(list(string)))
    path_delete_after_30_day = list(string)
  }))
  description = "List bucket, write if it's creation or not. In role members map, add specific role to use bucket (ex roles/storage.admin) with list use can have this role (mail for group and sa name for sa)."
}

variable "get_sa" {
  type = map(string)
}
variable "create_account" {
  type = map(string)
}
