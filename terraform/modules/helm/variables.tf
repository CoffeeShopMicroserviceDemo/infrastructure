variable "elastic_helm_repository" {
  description = "Location of the helm repository for the elastic stack"
  type = string
  default = "https://helm.elastic.co"
}

variable "istio_helm_repository" {
  description = "Location of the helm repository for istio"
  type = string
  default = "https://github.com/istio/istio/tree/master/manifests/charts"
}