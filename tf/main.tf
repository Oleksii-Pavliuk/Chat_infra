module "project" {
  source                    = "./project"
  proj_environment          = "development"
  proj_resources            = [module.development_cluster.cluster_urn,module.production_cluster.cluster_urn]
  do_token                  =  var.do_token
}


module "container-registry" {
  source                    = "./container-registry"
  do_token                  =  var.do_token
}


module "development_cluster" {
  source                    = "./cluster"
  cluster_name              = "development"
  do_token                  =  var.do_token
}



module "argocd_dev" {
  source           = "./argocd"

  cluster_client_certificate = module.development_cluster.client_certificate
  cluster_client_key = module.development_cluster.client_key
  cluster_ca_certificate = module.development_cluster.ca_certificate
  cluster_endpoint = module.development_cluster.cluster_endpoint
  cluster_token = module.development_cluster.token

  chart_version    = "5.46.0"
}


module "argocd_dev_root" {
  source             = "./argocd-root"

  cluster_client_certificate = module.development_cluster.client_certificate
  cluster_client_key = module.development_cluster.client_key
  cluster_ca_certificate = module.development_cluster.ca_certificate
  cluster_endpoint = module.development_cluster.cluster_endpoint
  cluster_token = module.development_cluster.token


  git_source_path    = "argocd/develepment/apps"
  git_source_repoURL = "git@github.com:Oleksii-Pavliuk/Chat_infra.git"
}