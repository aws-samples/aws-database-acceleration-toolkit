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

  output "db_password" {
  value     = data.aws_subnets.primary

}

output "ami1" {
  value     = module.jenkins.ami

}

output "key" {
  value     = module.jenkins.key

}