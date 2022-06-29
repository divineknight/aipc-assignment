resource "docker_image" "dov-bear" {
  name = "chukmunnlee/dov-bear:${var.image_version}"
}

# Create a container
resource "docker_container" "dov-bear-container" {
  count = length(var.ports)
  image = docker_image.dov-bear.latest
  name  = "dov-${count.index}"
  env = [
    "INSTANCE_NAME=dov-${count.index}",
    "INSTANCE_HASH=hash-${count.index}"
  ]
  ports {
    internal = 3000
    external = var.ports[count.index]
  }
}

resource "digitalocean_droplet" "nginx" {
  image  = var.DO_image
  name   = var.DO_name
  region = var.DO_region
  size   = var.DO_size

  ssh_keys = [data.digitalocean_ssh_key.yj-mac.id]
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.DO_private_key)
    host        = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install nginx -y",
      "systemctl enable nginx",
      "systemctl start nginx"
    ]
  }

  provisioner "file" {
    source      = "./nginx.conf"
    destination = "etc/nginx/nginx.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "systemctl restart nginx"
    ]
  }
}

# resource "local_file" "nginx-config" {
#   content = templatefile("./nginx.conf.tpl", {
#     host_ip         = var.docker_host_ip
#     container_ports = docker_container.dov-bear-container[*].ports[0].external
#   })
#   filename        = "nginx.conf"
#   file_permission = "0444"
# }

resource "local_file" "root_at_nginx" {
  content  = ""
  filename = "root@${digitalocean_droplet.nginx.ipv4_address}"
}

output "nginx_ip" {
  value = digitalocean_droplet.nginx.ipv4_address
}

output "docker_external_ip" {
  value = docker_container.dov-bear-container[*].ports[0].external
}

