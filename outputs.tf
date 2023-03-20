
output "private_key_ssh" {
  value     = tls_private_key.private_key.private_key_openssh
  sensitive = true
}
