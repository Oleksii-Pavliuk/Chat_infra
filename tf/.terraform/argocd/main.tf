provider "helm" {
  debug = true
  kubernetes {
    host     = var.cluster_endpoint
    token                  = var.cluster_token
    client_key             = base64decode(var.cluster_client_key)
    client_certificate     = base64decode(var.cluster_client_certificate)
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = "argocd"
  version          = var.chart_version
  create_namespace = true
  values           = [file("${path.module}/argocd.yaml")]
}
