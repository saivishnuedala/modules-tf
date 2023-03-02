# Creating a S3 bucket
resource "aws_s3_bucket" "s3-11" {
  bucket = var.bucket_name

   tags = {
    Name        = var.bucket_name
    # Environment = var.environment
  }
}