variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "az1" {
  description = "The availability zone for AZ 1"
  type        = string
}

variable "az2" {
  description = "The availability zone for AZ 2"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "CIDR block for public subnet in AZ 1"
  type        = string
}

variable "private_subnet_az1_cidr" {
  description = "CIDR block for private subnet in AZ 1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for public subnet in AZ 2"
  type        = string
}

variable "private_subnet_az2_cidr" {
  description = "CIDR block for private subnet in AZ 2"
  type        = string
}
