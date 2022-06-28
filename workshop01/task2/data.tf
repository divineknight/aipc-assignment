data "docker_image" "northwind-app" {
  name = "stackupiss/northwind-app:v1"
}

data "docker_image" "northwind-db" {
  name = "stackupiss/northwind-db:v1"
}