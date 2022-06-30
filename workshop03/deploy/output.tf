output "code-server-ip-address" {
  value = digitalocean_droplet.vs-code-server.ipv4_address
}

output "code-server-domain-name" {
  value = "code-${digitalocean_droplet.vs-code-server.ipv4_address}.nip.io"
}