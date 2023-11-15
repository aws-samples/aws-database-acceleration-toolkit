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

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state"
 
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}