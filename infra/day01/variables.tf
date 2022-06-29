variable "DO_token" {
  type      = string
  sensitive = true
}

variable "ports" {
  type    = list(number)
  default = [8080, 8081, 8082, 8083]
}

variable "DO_name" {
  type    = string
  default = ""
}

variable "DO_image" {
  type    = string
  default = "ubuntu-18-04-x64"
}

variable "DO_region" {
  type    = string
  default = ""
}

variable "DO_size" {
  type    = string
  default = ""
}