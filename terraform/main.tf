locals {
  common_tags = {
    owner = "pravallika"
    email = "pravs2017@gmail.com"
    costcentre = ""
    project = "streaming-app"
    live = "no"
    environment = "pravs"
    technical_contact = "pravallika"
  }
}
resource "aws_s3_bucket" "source" {
  bucket = "streaming-app-${local.common_tags.environment}-src"
  acl    = "private"
  tags = local.common_tags
}
resource "aws_s3_bucket" "source" {
  bucket = "streaming-app-${local.common_tags.environment}-tgt"
  acl    = "private"
  tags = local.common_tags
}




