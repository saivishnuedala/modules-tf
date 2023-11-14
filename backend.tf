terraform {
  backend "s3" {
    region  = "us-east-1"
    encrypt = true
    bucket  = "bucket-name" #change bucket_name 
    key     = "terraform.tfstate"
    #dynamodb_table = "tfstatelock"
  }  
}