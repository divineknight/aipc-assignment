source "digitalocean" "droplet" {
  api_token    = var.DO_token
  image        = "ubuntu-20-04-x64"
  region       = "sgp1"
  size         = "s-1vcpu-2gb"
  ssh_username = "root"
  snapshot_name = "code-20-04-x64"
}

build {
  sources = ["source.digitalocean.droplet"]

    provisioner ansible {
        playbook_file = "playbook.yaml"
    }
}