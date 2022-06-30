data "digitalocean_ssh_key" "public-ssh-key" {
  name = var.DO_upload_public_ssh_key
}