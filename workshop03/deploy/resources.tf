resource "digitalocean_droplet" "vs-code-server" {
  image  = data.digitalocean_image.code-server-image.id
  name   = var.DO_name
  region = var.DO_region
  size   = var.DO_size

  ssh_keys = [data.digitalocean_ssh_key.public-ssh-key.id]
}

resource "local_file" "inventory-file" {
  content = templatefile("./template/inventory-template.yaml", {
    ssh_private_key         = var.ssh_private_key_path
    server-ip               = digitalocean_droplet.vs-code-server.ipv4_address
    code_server_pwd         = var.code_server_pwd
    code_server_domain_name = "code-${digitalocean_droplet.vs-code-server.ipv4_address}.nip.io"
  })
  filename        = "inventory.yaml"
  file_permission = "0444"
}