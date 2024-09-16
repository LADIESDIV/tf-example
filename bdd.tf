resource "google_sql_database_instance" "main" {
  for_each         = var.bdd
  name             = each.key
  database_version = each.value.version
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
  deletion_protection = false
}
