

resource "aws_internet_gateway" "mili-ig-project-c" {
  vpc_id = aws_vpc.mili-vpc-project-c.id

  tags = {
    Name       = "mili-ig-project-c"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}
