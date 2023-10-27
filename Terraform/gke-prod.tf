resource "google_container_cluster" "cluster_prod" {
  name                     = "cluster-prod" 
  location                 = "asia-northeast3" 
  node_locations           = ["asia-northeast3-a", "asia-northeast3-b", "asia-northeast3-c"] 
  remove_default_node_pool = true 
  initial_node_count       = 1   
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  logging_service = "logging.googleapis.com/kubernetes"
  enable_intranode_visibility = true

  addons_config {
    horizontal_pod_autoscaling { 
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
  }

  vertical_pod_autoscaling {
    enabled = false
  }

  ip_allocation_policy {
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "192.168.0.0/28" 

    master_global_access_config {
      enabled = true
    }
  }

  node_config {
      oauth_scopes = ["cloud-platform"]
      machine_type = "n2-standard-2"
      disk_type = "pd-balanced"
      disk_size_gb = "100"
    }


  lifecycle {ignore_changes = all}
}


resource "google_container_node_pool" "node_pool_prod" {
  name       = "node-pool-prod"
  cluster    = google_container_cluster.cluster_prod.id
  node_count = 3

  autoscaling {
    min_node_count = 3
    max_node_count = 9
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    machine_type = "n2-standard-2"
    disk_type = "pd-balanced"
    disk_size_gb = "100"
  }

  lifecycle {ignore_changes = all}
}
