provider "google" {
  credentials = "${lookup(var.provider, "credentials_path")}"
  project     = "${lookup(var.provider, "project")}"
  region      = "${lookup(var.provider, "region")}"
}
