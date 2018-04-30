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

variable "google_sql_database_instance" {
    type = "map"
    default = {
        region = "asia-northeast1"
        database_version = "POSTGRES_9_6"
        tier = "db-f1-micro"
        disk_size = "10"
        disk_type = "PD_SSD"
        zone = "asia-northeast1-a"
    }
}

variable "google_sql_user" {
    type = "map"
}
