resource "google_bigquery_dataset" "raw" {
  dataset_id                 = "bq_zapata_bi_raw"
  description                = "Datos crudos tal como llegan — nunca se transforman aquí"
  location                   = var.bq_location
  project                    = var.project_id
  delete_contents_on_destroy = false

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "google_bigquery_dataset" "staging" {
  dataset_id                 = "bq_zapata_bi_staging"
  description                = "Datos limpios, tipados, deduplicados y validados"
  location                   = var.bq_location
  project                    = var.project_id
  delete_contents_on_destroy = false

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "google_bigquery_dataset" "core" {
  dataset_id                 = "bq_zapata_bi_core"
  description                = "Modelo dimensional: dimensiones y tablas de hechos"
  location                   = var.bq_location
  project                    = var.project_id
  delete_contents_on_destroy = false

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "google_bigquery_dataset" "semantic" {
  dataset_id                 = "bq_zapata_bi_semantic"
  description                = "Vistas con métricas oficiales — única fuente para dashboards e IA"
  location                   = var.bq_location
  project                    = var.project_id
  delete_contents_on_destroy = false

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "google_bigquery_dataset" "audit" {
  dataset_id                 = "bq_zapata_bi_audit"
  description                = "Registro de cargas, errores y cuarentena"
  location                   = var.bq_location
  project                    = var.project_id
  delete_contents_on_destroy = false

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
