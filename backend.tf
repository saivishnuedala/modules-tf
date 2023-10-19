terraform {
  backend "s3" {
    region  = "us-east-1"
    encrypt = true
    bucket  = "tfbackendstore" #change bucket_name
    key     = "dev/terraform.tfstate"
    dynamodb_table = "tfstatelock"
  }  
}