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
