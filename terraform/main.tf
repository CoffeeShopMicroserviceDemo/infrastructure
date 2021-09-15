//--------------------------------------------------------------------
// Variables
variable "do_token" {
  description = "Digital Ocean personal access token"
  type = string
}
variable "do_project_name" {
  description = "Digital Ocean project name"
  type = string
  default = "coffee-shop"
}
variable "do_k8s_name" {
  description = "Digital Ocean kubernetes cluster name"
  type = string
  default = "do-k8s"
}

//--------------------------------------------------------------------
// Modules

module "kubernetes" {
  source  = "app.terraform.io/coffeeshopmicroservicedemo/kubernetes/digitalocean"
  version = "0.1.0-alpha.2"

  do_project_name = var.do_project_name
  do_k8s_name = var.do_k8s_name
  do_token = var.do_token
}

module "elastic" {
  source  = "app.terraform.io/coffeeshopmicroservicedemo/elastic/helm"
  version = "0.1.0-alpha.1"

  do_project_id = module.kubernetes.do_project_id
  do_token = var.do_token

  depends_on = [module.kubernetes.do_project_id]
}

module "istio" {
  source  = "app.terraform.io/coffeeshopmicroservicedemo/istio/helm"
  version = "0.1.0-alpha.1"

  do_project_id = module.kubernetes.do_project_id
  do_token = var.do_token

  depends_on = [module.kubernetes.do_project_id]
}

module "kubesphere" {
  source  = "app.terraform.io/coffeeshopmicroservicedemo/kubesphere/helm"
  version = "0.1.0-alpha.1"

  do_project_id = module.kubernetes.do_project_id
  do_token = var.do_token

  depends_on = [module.kubernetes.do_project_id]
}