provider "helm" {
  kubernetes {
    config_path = "/Users/owen_hayes/coding/spring/coffee-shop/infrastructure/terraform/kubeconfig_do.yaml"
  }
}
provider "kubernetes" {
  config_path = "/Users/owen_hayes/coding/spring/coffee-shop/infrastructure/terraform/kubeconfig_do.yaml"
}