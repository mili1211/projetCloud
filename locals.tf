
locals {
  bastion_key = tls_private_key.private_key.private_key_openssh
  local_key   = tls_private_key.private_key.private_key_pem
}
