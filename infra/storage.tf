resource "google_storage_bucket" "excel_landing" {
  name                        = "${var.project_id}-excel-landing"
  project                     = var.project_id
  location                    = var.gcs_location
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = false

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 365
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }

  labels = {
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "excel-ingesta"
  }
}
