variable "DO_token" {
  type      = string
  sensitive = true
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "network_name" {
  type    = string
  default = "mynet"
}

variable "app_name" {
  type    = string
  default = "myapp"
}

variable "db_name" {
  type    = string
  default = "mydb"
}

variable "db_vol_name" {
  type    = string
  default = "dbvol"
}


# variable "nw_images" {
#   type = 

# }