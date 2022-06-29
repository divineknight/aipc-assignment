data "docker_image" "dov-bear" {
  name = "chukmunnlee/dov-bear:v2"
}

# Create a container
resource "docker_container" "dov-bear-container" {
  count = length(var.ports)
  image = data.docker_image.dov-bear.id
  name  = "dov-bear-${count.index}"
  env = [
    "INSTANCE_NAME = dov-bear-${count.index}",
    "INSTANCE_HASH = ${count.index}"
  ]
  ports {
    internal = 3000
    external = var.ports[count.index]
  }
}

output "container-names" {
  value = [for c in docker_container.dov-bear-container : c.name]
}

resource "local_file" "container-name" {
  content         = join(",", [for c in docker_container.dov-bear-container : c.name])
  filename        = "container-names.txt"
  file_permission = "0644"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc2"
  size   = "s-1vcpu-1gb"

  connection {

  }
}
