
#Public subnet 
resource "aws_subnet" "mili-subnetpub-project-c" {
  vpc_id            = aws_vpc.mili-vpc-project-c.id
  availability_zone = "eu-west-1a"
  cidr_block        = var.cidr_public_subnet

  tags = {
    Name       = "mili-subnetpub-project-c"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

resource "aws_route_table_association" "mili-rtb-public" {
  subnet_id      = aws_subnet.mili-subnetpub-project-c.id
  route_table_id = aws_route_table.mili-rtb-public.id
}

#Private subnet 
resource "aws_subnet" "mili-subnetpriv-project-c" {
  vpc_id            = aws_vpc.mili-vpc-project-c.id
  availability_zone = "eu-west-1b"
  cidr_block        = var.cidr_private_subnet

  tags = {
    Name       = "mili-subnetpriv-project-c"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

resource "aws_route_table_association" "mili-rtb-private" {
  subnet_id      = aws_subnet.mili-subnetpriv-project-c.id
  route_table_id = aws_route_table.mili-rtb-private.id
}
