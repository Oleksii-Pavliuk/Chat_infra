variable "cluster_endpoint" {
  description = "Endpoint of the cluster to deploy ArgoCD"
  type        = string
}

variable "cluster_token" {
  description = "token of the cluster to deploy ArgoCD"
  type        = string
}

variable "cluster_client_certificate" {
  description = "client_certificate of the cluster to deploy ArgoCD"
  type        = string
}

variable "cluster_client_key" {
  description = "client_key of the cluster to deploy ArgoCD"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "Cert of the cluster to deploy ArgoCD"
  type        = string
}


variable "chart_version" {
  description = "Helm Chart Version of ArgoCD: https://github.com/argoproj/argo-helm/releases"
  type        = string
  default     = "5.46.0"
}
