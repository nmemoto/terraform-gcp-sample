resource "google_sql_database_instance" "master" {
  name = "${lookup(var.google_sql_database_instance, "name")}"
  database_version = "${lookup(var.google_sql_database_instance, "database_version")}"
  region = "${lookup(var.google_sql_database_instance, "region")}"

  settings {
    tier = "${lookup(var.google_sql_database_instance, "tier")}"
    disk_size = "${lookup(var.google_sql_database_instance, "disk_size")}"
    disk_type = "${lookup(var.google_sql_database_instance, "disk_type")}"

    ip_configuration {
      ipv4_enabled = true
      require_ssl = false
      authorized_networks {
        name="Google compute instance"
        value="${google_compute_instance.default.network_interface.0.access_config.0.assigned_nat_ip}/32"
      }
    }
  }
  project = "${lookup(var.provider, "project")}"
}

resource "google_sql_user" "users" {
  instance = "${google_sql_database_instance.master.name}"
  name     = "${lookup(var.google_sql_user, "name")}"
  password = "${lookup(var.google_sql_user, "password")}"
}
