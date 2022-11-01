variable "vpc_cidr" {
  default = "10.35.0.0/16"
}

variable "public_cidrs" {
  type    = list(string)
  default = ["10.35.1.0/24", "10.35.2.0/24"]
}

variable "private_cidrs" {
  type    = list(string)
  default = ["10.35.30.0/24", "10.35.40.0/24"]
}

variable "environment" {
  description = "dev env"
}

variable "availability_zones" {

}