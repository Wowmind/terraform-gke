
#GKE CLUSTER

resource "google_container_cluster" "primary" {
  name = "${var.project_id}-gke"
  location = var.region
  remove_default_node_pool = true
  initial_node_count = 1

  network = google_compute_network.vpc.name
  subnetwork = google_subnetwork_subnet.name
}

# Managed node pool

resource "google_container_node_pool" "primary_nodes" {
  name = "${google_container.primary.name}-node-pool"
  location = var.region
  cluster = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
    ]
    labels = {
      env = vars.project_id
    }

    machine_type = "n1-standard-1"
    tags =["gke-nodes", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints ="true"
    }
  }
}