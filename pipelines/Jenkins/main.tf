locals {
  region         = var.region
}

data "aws_subnets" "primary" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

}

module "jenkins" {
  source = "../../modules/tffiles-jenkins"
  vpc_id = var.vpc_id
  myregion = var.region
  subnet_ids         = tolist(data.aws_subnets.primary.ids)
  }