provider "helm" {
  kubernetes {
    host             = data.digitalocean_kubernetes_cluster.k8s.endpoint
    token            = data.digitalocean_kubernetes_cluster.k8s.kube_config[0].token
    cluster_ca_certificate = base64decode(data.digitalocean_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate)
  }
  alias = "do_helm"
}

provider "digitalocean" {
  token = var.do_token
  alias = "do"
}