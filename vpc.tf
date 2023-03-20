
resource "aws_vpc" "mili-vpc-project-c" {
  cidr_block = var.cidr_vpc

  tags = {
    Name       = "mili-vpc-project-c"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}
