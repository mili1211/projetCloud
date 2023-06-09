
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "mili-keypair-project-c"
  public_key = tls_private_key.private_key.public_key_openssh
}
