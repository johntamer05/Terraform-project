resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_az1_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az1
  tags = {
    Name = "public_subnet_az1"
  }
}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet_az1_cidr
  availability_zone       = var.az1
  tags = {
    Name = "private_subnet_az1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_az2_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az2
  tags = {
    Name = "public_subnet_az2"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet_az2_cidr
  availability_zone       = var.az2
  tags = {
    Name = "private_subnet_az2"
  }
}
