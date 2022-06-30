variable "DO_token" {
  type      = string
  sensitive = true
}

variable "DO_upload_public_ssh_key" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}

variable "DO_name" {
  type    = string
  default = "vs-code-server"
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
  default = "s-1vcpu-2gb"
}

variable "code_server_pwd" {
  type      = string
  sensitive = true
}

variable "code_server_image_name" {
  type = string
}