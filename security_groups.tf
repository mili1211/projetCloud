
#Bastion's Security Group 
resource "aws_security_group" "ansible-controller-sg-mili" {
  name   = "ansible-controller-sg-mili"
  vpc_id = aws_vpc.mili-vpc-project-c.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "ansible-controller-sg-mili"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

#Private EC2 Security Group 
resource "aws_security_group" "docker-host-sg-mili" {
  name   = "docker-host-sg-mili"
  vpc_id = aws_vpc.mili-vpc-project-c.id
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.load-balancer-sg-mili.id]
  }
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ansible-controller-sg-mili.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "docker-host-sg-mili"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

#LB Security Group
resource "aws_security_group" "load-balancer-sg-mili" {
  name   = "load-balancer-sg-mili"
  vpc_id = aws_vpc.mili-vpc-project-c.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "load-balancer-sg-mili"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

#Jenkins Security Group
resource "aws_security_group" "jenkins-sg-mili" {
  name   = "jenkins-sg-mili"
  vpc_id = aws_vpc.mili-vpc-project-c.id
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "jenkins-sg-mili"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}                   
