resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_az1" {
  subnet_id      = var.public_subnet_az1
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_az2" {
  subnet_id      = var.public_subnet_az2
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_subnet_az1" {
  subnet_id      = var.private_subnet_az1
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_az2" {
  subnet_id      = var.private_subnet_az2
  route_table_id = aws_route_table.private_rt.id
}
