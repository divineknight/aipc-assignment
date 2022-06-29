variable "DO_token" {
  type      = string
  sensitive = true
}

variable "DO_private_key" {
  type      = string
  sensitive = true
}

variable "image_version" {
  type    = string
  default = "v1"
}

variable "ports" {
  type    = list(number)
  default = [8080, 8081, 8082]
}

variable "DO_name" {
  type    = string
  default = "nginx"
}

variable "DO_image" {
  type    = string
  default = "ubuntu-20-04-x64"
}

variable "DO_region" {
  type    = string
  default = "SGP1"
}

variable "DO_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "docker_host_ip" {
  type    = string
  default = "188.166.232.42"
}
