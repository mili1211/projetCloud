resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.mili-subnetpub-project-c.id
  vpc_security_group_ids      = [aws_security_group.jenkins-sg-mili.id]
  associate_public_ip_address = true
  key_name                    = "mili-keypair-project-c"
  iam_instance_profile        = data.aws_iam_role.iam.name

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \ https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
EOF

  tags = {
    Name       = "jenkins"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }

  volume_tags = {
    Name       = "Jenkins"
    "owner"    = var.owner
    "entity"   = var.entity
    "ephemere" = var.ephemere_non
  }
}
