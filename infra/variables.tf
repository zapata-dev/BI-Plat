variable "project_id" {
  type        = string
  description = "ID del proyecto GCP"
  default     = "zapata-bi-dev"
}

variable "region" {
  type        = string
  description = "Region primaria de GCP"
  default     = "us-central1"
}

variable "environment" {
  type        = string
  description = "Ambiente: dev | prod"
  default     = "dev"
}

variable "db_name" {
  type        = string
  description = "Nombre de la base de datos dentro de Cloud SQL"
  default     = "zapata_bi"
}

variable "db_user" {
  type        = string
  description = "Usuario de la aplicación en Cloud SQL"
  default     = "zapata_app"
}

variable "bq_location" {
  type        = string
  description = "Región de BigQuery para los datasets"
  default     = "northamerica-south1"
}

variable "gcs_location" {
  type        = string
  description = "Región del bucket de Cloud Storage"
  default     = "northamerica-south1"
}
