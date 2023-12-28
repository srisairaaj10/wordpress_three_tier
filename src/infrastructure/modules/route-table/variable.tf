variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = object({
    public_1  = string
    public_2  = string
    private_1 = string
    private_2 = string
    private_3 = string
    private_4 = string
  })
}


variable "nat_ids" {
  type = object({
    nat_id1 = string
    nat_id2 = string
  })
}

variable "internet_gateway_id" {
  type = string
  default = "wordress-igw"
}
