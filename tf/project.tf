
resource "digitalocean_project" "demo" {
  name        = "demo"
  description = "A project to represent development resources."
  purpose     = "K8s cluster"
  environment = "Development"
  resources = [
    digitalocean_kubernetes_cluster.development.urn,
    digitalocean_kubernetes_cluster.production.urn
  ]
}


# Create a new container registry
resource "digitalocean_container_registry" "foobar" {
  name                   = "cplk01-test-foobar"
  subscription_tier_slug = "starter"
}

#Export credentials to use in k8s cluster
resource "digitalocean_container_registry_docker_credentials" "foobar" {
  registry_name = digitalocean_container_registry.foobar.name
}


data "digitalocean_kubernetes_versions" "example" {
  version_prefix = "1."
}

# Prod cluster
resource "digitalocean_kubernetes_cluster" "production" {
  name         = "production"
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


# Dev cluster
resource "digitalocean_kubernetes_cluster" "development" {
  name         = "development"
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


resource "kubernetes_secret" "container_registry_creds" {
  metadata {
    name = "docker-cfg"
  }

  data = {
    ".dockerconfigjson" = digitalocean_container_registry_docker_credentials.foobar.docker_credentials
  }

  type = "kubernetes.io/dockerconfigjson"
}



