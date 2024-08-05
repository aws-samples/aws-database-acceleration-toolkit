locals {
  region         = var.region
}

data "aws_subnets" "primary" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
provider = aws.primary
}

module "jenkins" {
  source = "../../modules/tffiles-jenkins"
  vpc_id = var.vpc_id
  region = var.region
  subnet_ids         = tolist(data.aws_subnets.primary.ids)[0]
  }

output "Jenkins_IP" {
  value     = module.jenkins.ec2instance

}

#output "private_key" {
#  value = nonsensitive(module.jenkins.private_key)
#}