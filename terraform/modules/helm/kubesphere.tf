resource "helm_release" "kubesphere" {
  name = "kubesphere"
  repository = "https://charts.kubesphere.io/main"
  chart = "ks-installer"
  namespace = "kubesphere-system"

  set {
    name = "service.type"
    value = "Loadbalancer"
  }
}