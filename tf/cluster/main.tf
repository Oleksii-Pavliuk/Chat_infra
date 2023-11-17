data "digitalocean_kubernetes_versions" "example" {
  version_prefix = "1."
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name         = var.cluster_name
  region       = "nyc1"
  auto_upgrade = true
  version = data.digitalocean_kubernetes_versions.example.latest_version

  maintenance_policy {
    day = "sunday"
    start_time = "04:00"
  }


  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb-amd"
    node_count = 3
  }
  registry_integration = true
}