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