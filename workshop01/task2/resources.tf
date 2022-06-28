# resource "docker_image" "app_images" {
#   for_each = []
# }

resource "docker_network" "mynet" {
  name = var.network_name
}

# Create a container for app
resource "docker_container" "northwind-app-container" {
  image = data.docker_image.northwind-app.id
  name  = var.app_name
  env = [
    "DB_HOST = ${var.db_name}",
    "DB_USER = ${var.db_user}",
    "DB_PASSWORD = ${var.db_password}"
  ]
  # env = [
  #   "DB_HOST = mydb",
  #   "DB_USER = root",
  #   "DB_PASSWORD = changeit"
  # ]
  ports {
    internal = 3000
    external = 8188
  }
  networks_advanced {
    name = docker_network.mynet.name
  }
}

# Create a container for db
resource "docker_container" "northwind-db-container" {
  image = data.docker_image.northwind-db.id
  name  = var.db_name
  # ports {
  #   internal = 3306
  #   external = 3306
  # }
  networks_advanced {
    name = docker_network.mynet.name
  }
  volumes {
    container_path = "/var/lib/mysql"
    volume_name    = docker_volume.db_volume.name
  }
}

# Create volume for DB 
resource "docker_volume" "db_volume" {
  name = var.db_vol_name
}