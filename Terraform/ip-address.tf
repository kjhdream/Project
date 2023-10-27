resource "google_compute_global_address" "ip_ingress_address" {
  name = "ip-ingress-address"
}

resource "google_compute_global_address" "ip_db_address_prod" {
  name          = "ip-db-address-prod"

  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = google_compute_network.vpc.id
}

resource "google_compute_global_address" "ip_db_address_dev" {
  name          = "ip-db-address-test"

  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = google_compute_network.vpc.id
}
