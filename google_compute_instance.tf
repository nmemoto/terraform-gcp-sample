resource "google_compute_instance" "default" {
  name         = "${lookup(var.google_compute_instance, "name")}"
  machine_type = "${lookup(var.google_compute_instance, "machine_type")}"
  zone         = "${lookup(var.provider, "region")}-a"
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  boot_disk {
    initialize_params {
      image = "${lookup(var.google_compute_instance, "image")}"
    }
  }

  allow_stopping_for_update = true

  tags = ["sample"]


  // Local SSD disk
  scratch_disk {
  }


  metadata {
    foo = "bar"
  }

  metadata_startup_script = "sudo yum install -y postgresql wget; wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy; chmod +x cloud_sql_proxy; /cloud_sql_proxy -instances=${lookup(var.provider, "project")}:${lookup(var.provider, "region")}:${lookup(var.google_sql_database_instance, "name")}=tcp:5432"

  service_account {
    scopes = "${var.service_account_scope}"
  }
}
