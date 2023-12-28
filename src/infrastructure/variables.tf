variable "region" {
  type    = string
  default = "us-east-1"
}

variable "config" {
  type    = string
  default = "~/.aws/config"
}

variable "credentials" {
  type    = string
  default = "~/.aws/credentials"
}

variable "my_ip" {
  description = "ip address"
  type        = string
  default     = "my_ip_addr"
}

variable "zone_one" {
  description = "region"
  type        = string
  default     = "us-east-1a"
}

variable "zone_two" {
  description = "region"
  type        = string
  default     = "us-east-1b"
}
