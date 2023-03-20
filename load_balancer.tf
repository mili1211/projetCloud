
resource "aws_lb" "load-balancer-mili" {
  name               = "load-balancer-mili"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load-balancer-sg-mili.id, aws_security_group.ansible-controller-sg-mili.id]
  subnets            = [aws_subnet.mili-subnetpub-project-c.id, aws_subnet.mili-subnetpriv-project-c.id]

  tags = {
    Name       = "load-balancer-mili"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

resource "aws_lb_target_group" "target-group-mili" {
  name     = "target-group-mili"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mili-vpc-project-c.id

  tags = {
    Name       = "target-group-mili"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}

resource "aws_lb_target_group_attachment" "mili-tg-attachment-priv" {
  target_group_arn = aws_lb_target_group.target-group-mili.arn
  target_id        = aws_instance.docker-host-mili.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "mili-tg-attachment-pub" {
  target_group_arn = aws_lb_target_group.target-group-mili.arn
  target_id        = aws_instance.ansible-controller-mili.id
  port             = 80
}


resource "aws_lb_listener" "milifront" {
  load_balancer_arn = aws_lb.load-balancer-mili.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-mili.arn
  }
}
