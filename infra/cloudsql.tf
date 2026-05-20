resource "random_password" "db_password" {
  length  = 32
  special = true
}

resource "google_sql_database_instance" "zapata_pg" {
  name                = "zapata-bi-pg-${var.environment}"
  database_version    = "POSTGRES_15"
  region              = var.region
  project             = var.project_id
  deletion_protection = true

  settings {
    tier                  = "db-f1-micro"
    availability_type     = "ZONAL"
    disk_size             = 10
    disk_type             = "PD_SSD"
    disk_autoresize       = true
    disk_autoresize_limit = 50

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.zapata_vpc.id
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration {
      enabled    = true
      start_time = "03:00"
      backup_retention_settings {
        retained_backups = 7
      }
    }
  }

  depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]
}

resource "google_sql_database" "zapata_db" {
  name     = "zapata_bi"
  instance = google_sql_database_instance.zapata_pg.name
  project  = var.project_id
}

resource "google_sql_user" "zapata_app_user" {
  name     = "zapata_app"
  instance = google_sql_database_instance.zapata_pg.name
  password = random_password.db_password.result
  project  = var.project_id
}
