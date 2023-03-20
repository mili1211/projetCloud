


#Bastion EC2
resource "aws_instance" "ansible-controller-mili" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.mili-subnetpub-project-c.id
  vpc_security_group_ids      = [aws_security_group.ansible-controller-sg-mili.id]
  associate_public_ip_address = true
  key_name                    = "mili-keypair-project-c"

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
ansible --version
sudo yum install git -y
git --version
git clone https://github.com/mili1211/ansible.git /home/ec2-user/ansible/
echo "${local.bastion_key}" > /home/ec2-user/.ssh/id_rsa
EOF

  tags = {
    Name       = "ansible-controller-mili"
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


#PrivateEC2
resource "aws_instance" "docker-host-mili" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.mili-subnetpriv-project-c.id
  vpc_security_group_ids      = [aws_security_group.docker-host-sg-mili.id]
  associate_public_ip_address = false
  key_name                    = "mili-keypair-project-c"


  tags = {
    Name       = "docker-host-mili"
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
