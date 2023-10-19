# Creating a S3 bucket
resource "aws_s3_bucket" "s3-12" {
  bucket = var.bucket_name

   tags = {
    Name        = var.bucket_name
    # Environment = var.environment
  }
}