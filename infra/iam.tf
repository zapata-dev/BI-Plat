# D.1 Backend — FastAPI en Cloud Run. Lee del semantic layer y Secret Manager.
resource "google_service_account" "backend" {
  account_id   = "zapata-bi-backend"
  display_name = "Zapata BI — Backend API"
  project      = var.project_id
}

resource "google_bigquery_dataset_iam_member" "backend_core_viewer" {
  dataset_id = google_bigquery_dataset.core.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${google_service_account.backend.email}"
}

resource "google_bigquery_dataset_iam_member" "backend_semantic_viewer" {
  dataset_id = google_bigquery_dataset.semantic.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${google_service_account.backend.email}"
}

resource "google_bigquery_dataset_iam_member" "backend_audit_viewer" {
  dataset_id = google_bigquery_dataset.audit.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${google_service_account.backend.email}"
}

resource "google_project_iam_member" "backend_job_user" {
  project = var.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.backend.email}"
}

resource "google_project_iam_member" "backend_secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.backend.email}"
}

# D.2 Pipeline — ingesta Excel → BigQuery. Escribe en raw/staging/core/audit.
resource "google_service_account" "pipeline" {
  account_id   = "zapata-bi-pipeline"
  display_name = "Zapata BI — Pipeline de Ingesta"
  project      = var.project_id
}

resource "google_bigquery_dataset_iam_member" "pipeline_raw_editor" {
  dataset_id = google_bigquery_dataset.raw.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.pipeline.email}"
}

resource "google_bigquery_dataset_iam_member" "pipeline_staging_editor" {
  dataset_id = google_bigquery_dataset.staging.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.pipeline.email}"
}

resource "google_bigquery_dataset_iam_member" "pipeline_core_editor" {
  dataset_id = google_bigquery_dataset.core.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.pipeline.email}"
}

resource "google_bigquery_dataset_iam_member" "pipeline_audit_editor" {
  dataset_id = google_bigquery_dataset.audit.dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.pipeline.email}"
}

resource "google_project_iam_member" "pipeline_job_user" {
  project = var.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.pipeline.email}"
}

resource "google_storage_bucket_iam_member" "pipeline_bucket_viewer" {
  bucket = google_storage_bucket.excel_landing.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.pipeline.email}"
}

resource "google_project_iam_member" "pipeline_secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.pipeline.email}"
}

# D.3 CI/CD — usada por Cloud Build para construir y desplegar.
resource "google_service_account" "cicd" {
  account_id   = "zapata-bi-cicd"
  display_name = "Zapata BI — CI/CD Cloud Build"
  project      = var.project_id
}

resource "google_project_iam_member" "cicd_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.cicd.email}"
}

resource "google_artifact_registry_repository_iam_member" "cicd_registry_writer" {
  project    = var.project_id
  location   = google_artifact_registry_repository.docker.location
  repository = google_artifact_registry_repository.docker.repository_id
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.cicd.email}"
}

resource "google_project_iam_member" "cicd_sa_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.cicd.email}"
}
