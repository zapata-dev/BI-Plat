resource "google_compute_network" "zapata_vpc" {
  name                    = "zapata-bi-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "zapata_subnet" {
  name                     = "zapata-bi-subnet"
  ip_cidr_range            = "10.10.0.0/24"
  region                   = var.region
  network                  = google_compute_network.zapata_vpc.id
  project                  = var.project_id
  private_ip_google_access = true
}

resource "google_compute_global_address" "private_ip_range" {
  name          = "zapata-bi-sql-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 20
  network       = google_compute_network.zapata_vpc.id
  project       = var.project_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network = google_compute_network.zapata_vpc.id
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
    google_compute_global_address.private_ip_range.name
  ]
}
