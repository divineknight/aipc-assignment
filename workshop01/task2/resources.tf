resource "docker_image" "northwind-app" {
  name = "stackupiss/northwind-app:v1"
  # force_remove = false
  # keep_locally = true
}

resource "docker_image" "northwind-db" {
  name = "stackupiss/northwind-db:v1"
  # force_remove = false
  # keep_locally = true
}

# Create docker network
resource "docker_network" "mynet" {
  name = var.network_name
}

# Create a container for app
resource "docker_container" "northwind-app-container" {
  image = docker_image.northwind-app.latest
  name  = var.app_name
  env = [
    "DB_HOST=${docker_container.northwind-db-container.name}",
    "DB_USER=${var.db_user}",
    "DB_PASSWORD=${var.db_password}"
  ]
  ports {
    internal = 3000
    external = 3000
  }
  networks_advanced {
    name = docker_network.mynet.name
  }
}

# Create a container for db
resource "docker_container" "northwind-db-container" {
  image = docker_image.northwind-db.latest
  name  = var.db_name
  ports {
    internal = 3306
    external = 3306
  }
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