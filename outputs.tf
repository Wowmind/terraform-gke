output "region" {
  value = var.zone
  description = "GCloud Zone"
}

output "project_id" {
  value = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
  description = "GKE Cluster name"
}

output "kubernetes_clusterr_host" {
  value = google_container_cluster.primary.endpoint
  description = "GKE Cluster host"
}