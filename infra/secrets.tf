resource "google_secret_manager_secret" "db_password" {
  secret_id = "zapata-bi-db-password"
  project   = var.project_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_v1" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = random_password.db_password.result
}

resource "google_secret_manager_secret" "db_connection_string" {
  secret_id = "zapata-bi-db-connection-string"
  project   = var.project_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "firebase_config" {
  secret_id = "zapata-bi-firebase-config"
  project   = var.project_id

  replication {
    auto {}
  }
}
