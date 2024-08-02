output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}

output "private_key" {
  value = tls_private_key.key_generate.private_key_pem
  sensitive = true
}

