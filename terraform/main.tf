module "kubernetes" {
  source  = "app.terraform.io/coffeeshopmicroservicedemo/kubernetes/digitalocean"
  version = "0.1.0-alpha.4"

  do_project_name = var.do_project_name
  do_k8s_name = var.do_k8s_name
  do_token = var.do_token

  providers = {
    digitalocean = digitalocean.do
  }
}

#module "elastic" {
#  source  = "app.terraform.io/coffeeshopmicroservicedemo/elastic/helm"
#  version = "0.1.0-alpha.2"
#
#  do_project_id = module.kubernetes.do_project_id
#  do_k8s_name = module.kubernetes.k8s_cluster_name
#  do_token = var.do_token
#
#  providers = {
#    digitalocean = digitalocean.do
#    helm = helm.do_helm
#  }
#
#  depends_on = [module.kubernetes.k8s_cluster_name]
#}

module "istio" {
  source  = "app.terraform.io/coffeeshopmicroservicedemo/istio/helm"
  version = "0.1.0-alpha.6"

  do_project_id = module.kubernetes.do_project_id
  do_k8s_name = module.kubernetes.k8s_cluster_name
  do_token = var.do_token

  providers = {
    digitalocean = digitalocean.do
    helm = helm.do_helm
  }

  depends_on = [module.kubernetes.k8s_cluster_name]
}

#module "kubesphere" {
#  source  = "app.terraform.io/coffeeshopmicroservicedemo/kubesphere/helm"
#  version = "0.1.0-alpha.3"
#
#  do_project_id = module.kubernetes.do_project_id
#  do_k8s_name = module.kubernetes.k8s_cluster_name
#  do_token = var.do_token
#
#  providers = {
#    digitalocean = digitalocean.do
#    helm = helm.do_helm
#  }
#
#  depends_on = [module.kubernetes.k8s_cluster_name]
#}