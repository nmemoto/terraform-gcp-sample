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

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = "${var.service_account_scope}"
  }
}
