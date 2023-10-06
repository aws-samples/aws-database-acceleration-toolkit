variable "awsprops" {
    type = map
    default = {
    ami = "ami-094125af156557ca2"
    itype = "t2.large"
    publicip = true
    keyname = "myseckey"
    secgroupname = "IAC-Sec-Group"
  }
}

resource "tls_private_key" "key_generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name   = "ec2_key"
  public_key = "${tls_private_key.key_generate.public_key_openssh}"
  }


resource "aws_instance" "project-iac" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = var.subnet_ids
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = aws_key_pair.key.key_name


  vpc_security_group_ids = var.security_group_ids
  root_block_device {
    delete_on_termination = true
   
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name ="Locust_APIGateway"
    Environment = "API Gateway Performance"
    OS = "UBUNTU"
    Managed = "IAC"
  }
  user_data = templatefile("${path.module}/startup_locust.sh.tpl")

}


output "key" {
  value = aws_key_pair.key.public_key
}
