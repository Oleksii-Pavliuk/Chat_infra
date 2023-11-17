output "cluster_urn" {
  value = digitalocean_kubernetes_cluster.cluster.urn
}

output "cluster_endpoint" {
  value = digitalocean_kubernetes_cluster.cluster.endpoint
}

output "token" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config.0.token
}

output "client_certificate" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate
}

output "client_key" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key
}

output "ca_certificate" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate
}