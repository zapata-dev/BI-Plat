output "vpc_name" {
  value       = google_compute_network.zapata_vpc.name
  description = "Nombre de la VPC"
}

output "vpc_id" {
  value       = google_compute_network.zapata_vpc.id
  description = "ID de la VPC"
}

output "cloudsql_instance_name" {
  value       = google_sql_database_instance.zapata_pg.name
  description = "Nombre de la instancia Cloud SQL"
}

output "cloudsql_private_ip" {
  value       = google_sql_database_instance.zapata_pg.private_ip_address
  description = "IP privada de Cloud SQL"
  sensitive   = true
}

output "db_password_secret_id" {
  value       = google_secret_manager_secret.db_password.secret_id
  description = "ID del secret de contraseña en Secret Manager"
}

output "bigquery_datasets" {
  value = {
    raw      = google_bigquery_dataset.raw.dataset_id
    staging  = google_bigquery_dataset.staging.dataset_id
    core     = google_bigquery_dataset.core.dataset_id
    semantic = google_bigquery_dataset.semantic.dataset_id
    audit    = google_bigquery_dataset.audit.dataset_id
  }
  description = "IDs de los datasets de BigQuery"
}

output "excel_landing_bucket" {
  value       = google_storage_bucket.excel_landing.name
  description = "Nombre del bucket de ingesta de Excel"
}

output "artifact_registry_url" {
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker.repository_id}"
  description = "URL del repositorio Docker en Artifact Registry"
}

output "sa_backend_email" {
  value       = google_service_account.backend.email
  description = "Email de la cuenta de servicio del backend"
}

output "sa_pipeline_email" {
  value       = google_service_account.pipeline.email
  description = "Email de la cuenta de servicio del pipeline"
}

output "sa_cicd_email" {
  value       = google_service_account.cicd.email
  description = "Email de la cuenta de servicio de CI/CD"
}
