
resource "aws_eip" "mili-eip-project-c" {
  vpc = true
}

resource "aws_nat_gateway" "mili-ng-project-c" {
  allocation_id = aws_eip.mili-eip-project-c.id
  subnet_id     = aws_subnet.mili-subnetpub-project-c.id

  tags = {
    Name       = "mili-ng-project-c"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }

  depends_on = [aws_internet_gateway.mili-ig-project-c]
}
