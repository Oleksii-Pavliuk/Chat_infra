variable "git_source_repoURL" {
  description = "GitSource repoURL to Track and deploy to EKS by ROOT Application"
  type        = string
}

variable "git_source_path" {
  description = "GitSource Path in Git Repository to Track and deploy to EKS by ROOT Application"
  type        = string
  default     = ""
}

variable "git_source_targetRevision" {
  description = "GitSource HEAD or Branch to Track and deploy to EKS by ROOT Application"
  type        = string
  default     = "HEAD"
}


variable "chart_version" {
  description = "Helm Chart Version of ArgoCD: https://github.com/argoproj/argo-helm/releases"
  type        = string
  default     = "5.46.0"
}

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