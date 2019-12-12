provider "aws" {
  region = "eu-west-1"
}
locals {
  live        = "no"
  environment = "dev"
  common_tags = {
    owner             = "pravallika"
    email             = "pravs2017@gmail.com"
    costcentre        = ""
    project           = "streaming-app"
    live              = "${local.live}"
    environment       = "${local.environment}"
    technical_contact = "pravallika"
  }
}

# terraform state file setup
# create an S3 bucket to store terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-dev-${local.common_tags.project}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(
    {
      Name = "S3 Remote Terraform State Store"
    },
    local.common_tags
  )
}

resource "aws_dynamodb_table" "terraform_dev_state_lock" {
  name           = "terraform-dev-state-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(
    {
      Name = "Terraform State Lock Table"
    },
    local.common_tags
  )
}