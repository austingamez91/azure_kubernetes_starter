variable "resource_group" {
  type    = string
  default = "kubernetes-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "cluster_name" {
  type    = string
  default = "kubernetes-aks"
}
