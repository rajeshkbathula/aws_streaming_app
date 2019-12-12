provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
}

terraform {
  backend "s3" {}
  required_version = "~> 0.12.18"
}




locals {
  common_tags = {
    owner = "pravallika"
    email = "pravs2017@gmail.com"
    costcentre = ""
    project = "streaming-app"
    live = var.live
    environment = var.env
    technical_contact = "pravallika"
  }
}
resource "aws_s3_bucket" "source" {
  bucket = "streaming-app-${local.common_tags.environment}-src"
  acl    = "private"
  tags = local.common_tags
}
resource "aws_s3_bucket" "tgt" {
  bucket = "streaming-app-${local.common_tags.environment}-tgt"
  acl    = "private"
  tags = local.common_tags
}




