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
