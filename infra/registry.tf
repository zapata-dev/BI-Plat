resource "google_artifact_registry_repository" "docker" {
  repository_id = "zapata-bi"
  project       = var.project_id
  location      = var.region
  format        = "DOCKER"
  description   = "Imágenes Docker del backend y frontend de la plataforma BI"

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}
