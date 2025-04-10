variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
}

variable "public_subnet_az1" {
  description = "Public Subnet AZ1 ID"
  type        = string
}

variable "public_subnet_az2" {
  description = "Public Subnet AZ2 ID"
  type        = string
}

variable "private_subnet_az1" {
  description = "Private Subnet AZ1 ID"
  type        = string
}

variable "private_subnet_az2" {
  description = "Private Subnet AZ2 ID"
  type        = string
}
