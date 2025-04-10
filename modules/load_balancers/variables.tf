variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for the public load balancer"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the private load balancer"
}
