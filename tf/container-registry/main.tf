# Create a new container registry
resource "digitalocean_container_registry" "foobar" {
  name                   = "cplk01-test-foobar"
  subscription_tier_slug = "starter"
}

#Export credentials to use in k8s cluster
resource "digitalocean_container_registry_docker_credentials" "foobar" {
  registry_name = digitalocean_container_registry.foobar.name
}