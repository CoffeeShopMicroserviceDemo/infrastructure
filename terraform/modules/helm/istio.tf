resource "helm_release" "istio_base" {
  name = "istio-base"
  chart = "base"
  repository = var.istio_helm_repository

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [module.digitalocean.k8s_cluster, kubernetes_namespace.istio_system]
}

resource "helm_release" "istiod" {
  name  = "istiod"
  chart = "istio-control/istio-discovery"
  repository = var.istio_helm_repository

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [module.digitalocean.k8s_cluster, kubernetes_namespace.istio_system, helm_release.istio_base]
}

resource "helm_release" "istio_ingress" {
  name  = "istio-ingress"
  chart = "gateways/istio-ingress"
  repository = var.istio_helm_repository

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [module.digitalocean.k8s_cluster, kubernetes_namespace.istio_system, helm_release.istiod]
}

resource "helm_release" "istio_egress" {
  name  = "istio-egress"
  chart = "gateways/istio-egress"
  repository = var.istio_helm_repository

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [module.digitalocean.k8s_cluster, kubernetes_namespace.istio_system, helm_release.istiod]
}

resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}