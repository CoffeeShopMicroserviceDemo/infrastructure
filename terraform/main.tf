module "digitalocean" {
  source = "./modules/digitalocean"
  do_token = var.do_token
}

module "helm" {
  source = "./modules/helm"
}
