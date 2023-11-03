output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}