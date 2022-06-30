data "digitalocean_ssh_key" "public-ssh-key" {
  name = var.DO_upload_public_ssh_key
}

data "digitalocean_image" "code-server-image" {
  name = var.code_server_image_name
}