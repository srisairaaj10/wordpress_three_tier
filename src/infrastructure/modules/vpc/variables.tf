variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "wordpress_vpc"

}


variable "dns_hostnames" {
  type    = bool
  default = true

}

variable "dns_support" {
  type    = bool
  default = true

}
