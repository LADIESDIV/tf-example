variable "region" {
  type        = string
  description = "Region name"
  default     = "europe-west1"
}

variable "project" {
  type        = string
  description = "Project id"
  default     = "test"
}

variable "iam_members" {
  type = map(object({
    type       = string
    creation   = bool
    globalrole = optional(list(string))
  }))
  description = "type : sa for service account or group, creation always false for group, globalrole is role that you wants (ex: roles/storage.admin). Key map in group mail or sa name."
  default     = {}
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
  validation {
    condition = alltrue([
      for value in var.list_bucket : can(regex("^lille-zenbox-adeo-2024-.*$", value.name))
    ])
    error_message = "Name bucket start by project name."
  }
  default = []
}

variable "list_repository" {
  type        = list(string)
  description = "List docker repo."
  default     = []
}

variable "oidc" {
  type = map(object({
    list_oidc_repo = list(map(string))
  }))
  description = "List repo with oidc for gcp."
  default     = {}
}

variable "bdd" {
  type = map(object({
    version = string
  }))
  description = "bdd creation."
  default     = {}
}
