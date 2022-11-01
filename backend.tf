
terraform {
  backend "s3" {
    region  = "us-east-1"
    encrypt = true
    bucket  = "tf-test-bucket21" #change bucket name
    key     = "dev/terraform.tfstate"
  }
}