resource "helm_release" "elasticsearch" {
  chart = "elasticsearch"
  name = "elasticsearch"
  namespace = "elastic-system"
  repository = var.elastic_helm_repository
}

resource "helm_release" "kibana" {
  chart = "kibana"
  name = "kibana"
  namespace = "elastic-system"
  repository = var.elastic_helm_repository
}