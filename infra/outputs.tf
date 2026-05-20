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
