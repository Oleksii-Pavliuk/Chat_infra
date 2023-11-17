resource "digitalocean_project" "myproject" {
  name        = "myproject"
  description = "my project"
  purpose     = "just to have this project"
  environment = var.proj_environment
  resources = var.proj_resources
}