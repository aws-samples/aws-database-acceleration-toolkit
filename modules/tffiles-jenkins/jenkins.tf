variable "awsprops" {
    type = map
    default = {
    itype = "t2.large"
    publicip = true
    keyname = "myseckey"
    secgroupname = "IAC-Sec-Group"
  }
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true

 provider = aws.primary
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "tls_private_key" "key_generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
  
}

resource "aws_key_pair" "key" {
  key_name   = "ec2_jenkins_key"
  public_key = "${tls_private_key.key_generate.public_key_openssh}"
  provider = aws.primary
  }

resource "aws_security_group" "jenkins_port" {
    vpc_id = var.vpc_id
    provider = aws.primary

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }    
  

     ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

       ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    lifecycle { create_before_destroy = true }
}

resource "aws_instance" "project-iac" {
  provider = aws.primary

  ami = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = var.subnet_ids
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = aws_key_pair.key.key_name

#associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.jenkins_port.id]
  root_block_device {
    delete_on_termination = true
   
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name ="Jenkins"
    OS = "UBUNTU"
    Managed = "IAC"
  }
  #user_data = templatefile("${path.module}/startup_locust.sh.tpl", { host_rest_regional = var.host_rest_regional , host_rest_edge =var.host_rest_edge, host_http_regional= var.host_http_regional})
#user_data =templatefile("startup_locust.tftpl")
  user_data = file("${path.module}/startup_jenkins.sh.tpl")

}


output "key" {
  value = aws_key_pair.key.public_key
}

output "ami" {
  value = data.aws_ami.amazon-linux-2.id
}