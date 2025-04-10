variable "ami_id" {}
variable "key_name" {}
variable "private_key_path" {}
variable "instance_type" {}

variable "instances" {
  type = list(object({
    name               = string
    subnet_id          = string
    security_group_id  = string
    assign_public_ip   = bool
    instance_type      = string
  }))
}


