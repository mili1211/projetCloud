
resource "aws_route_table" "mili-rtb-public" {
  vpc_id = aws_vpc.mili-vpc-project-c.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mili-ig-project-c.id
  }

  tags = {
    Name       = "mili-rtb-public"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

resource "aws_route_table" "mili-rtb-private" {
  vpc_id = aws_vpc.mili-vpc-project-c.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mili-ng-project-c.id
  }

  tags = {
    Name       = "mili-rtb-private"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

