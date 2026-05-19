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
