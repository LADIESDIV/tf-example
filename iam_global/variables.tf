variable "project" {
  type        = string
  description = "Project id"
}

variable "type" {
  type        = string
  description = "type member"
}

variable "sa" {
  type        = string
  description = "mail sa"
}

variable "globalrole" {
  type        = list(string)
  description = "list role"
}

variable "get_sa" {
  type = map(any)
}
variable "create_account" {
  type = map(any)
}
