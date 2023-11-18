provider "kubernetes" {
  host     = var.cluster_endpoint

  token                  = var.cluster_token
  client_key             = base64decode(var.cluster_client_key)
  client_certificate     = base64decode(var.cluster_client_certificate)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
  host     = var.cluster_endpoint

  token                  = var.cluster_token
  client_key             = base64decode(var.cluster_client_key)
  client_certificate     = base64decode(var.cluster_client_certificate)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}

resource "kubernetes_manifest" "argocd_root" {
  provider = kubernetes
  manifest = yamldecode(templatefile("${path.module}/root.yaml", {
    apiVersion = "argoproj.io/v1alpha1"
    path           = var.git_source_path
    repoURL        = var.git_source_repoURL
    targetRevision = var.git_source_targetRevision
  }))
}
