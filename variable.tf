variable "gke_num_nodes" {
  default = 2
  description = "number of gke nodes"
}

variable "project_id" {}

variable "credentials" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-b"
}