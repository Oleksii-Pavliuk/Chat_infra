provider "helm" {
  kubernetes {
    host     = var.cluster_endpoint

    client_key             = base64decode(var.cluster_client_key)
    client_certificate     = base64decode(var.cluster_client_certificate)
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}