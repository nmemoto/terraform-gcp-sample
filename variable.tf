variable "provider" {
    type = "map"
    default = {
        region = "asia-northeast1"
    }
}

variable "google_compute_instance" {
    type = "map"
    default = {
        image = "centos-cloud/centos-7"
        machine_type = "n1-standard-1"
    }
}

variable "service_account_scope" {
    type = "list"
    default = [
        "cloud-platform"
    ]
}
