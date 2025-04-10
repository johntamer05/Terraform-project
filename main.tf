provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id                       = module.vpc.vpc_id
  az1                           = "us-east-1a"
  az2                           = "us-east-1b"
  public_subnet_az1_cidr       = "10.0.0.0/24"
  private_subnet_az1_cidr      = "10.0.1.0/24"
  public_subnet_az2_cidr       = "10.0.2.0/24"
  private_subnet_az2_cidr      = "10.0.3.0/24"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}


module "route_tables" {
  source = "./modules/route_table"

  vpc_id             = module.vpc.vpc_id
  internet_gateway_id = module.gateways.internet_gateway_id
  nat_gateway_id      = module.gateways.nat_gateway_id

  public_subnet_az1  = module.subnets.public_subnet_az1_id
  public_subnet_az2  = module.subnets.public_subnet_az2_id
  private_subnet_az1 = module.subnets.private_subnet_az1_id
  private_subnet_az2 = module.subnets.private_subnet_az2_id
}


module "gateways" {
  source = "./modules/gateways"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_az1_id
}



module "load_balancers" {
  source = "./modules/load_balancers"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = [module.subnets.public_subnet_az1_id, module.subnets.public_subnet_az2_id]
  private_subnet_ids = [
    module.subnets.private_subnet_az1_id,
    module.subnets.private_subnet_az2_id
  ]
}



data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}


module "instances" {
  source            = "./modules/instances"
  ami_id            = data.aws_ami.latest_amazon_linux.id
  key_name          = "labsuser"         # Key pair name in AWS (without .pem)
  private_key_path  = "./labsuser.pem"   # Path to key file on your machine
  instance_type     = "t2.micro"

  instances = [
    {
      name              = "public-ec2-az1"
      subnet_id         = module.subnets.public_subnet_az1_id
      security_group_id = module.security_groups.public_sg_ids[0]
      assign_public_ip  = true
      instance_type     = "t2.micro"
    },
    {
      name              = "private-ec2-az1"
      subnet_id         = module.subnets.private_subnet_az1_id
      security_group_id = module.security_groups.private_sg_ids[0]
      assign_public_ip  = false
      instance_type     = "t2.micro"
    },
    {
      name              = "public-ec2-az2"
      subnet_id         = module.subnets.public_subnet_az2_id
      security_group_id = module.security_groups.public_sg_ids[1]
      assign_public_ip  = true
      instance_type     = "t2.micro"
    },
    {
      name              = "private-ec2-az2"
      subnet_id         = module.subnets.private_subnet_az2_id
      security_group_id = module.security_groups.private_sg_ids[1]
      assign_public_ip  = false
      instance_type     = "t2.micro"
    }
  ]
}


