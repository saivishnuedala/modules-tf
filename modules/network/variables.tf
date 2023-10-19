variable "vpc_cidr" {
  default = "10.35.0.0/16"
}

# variable "public_cidrs" {
#   type    = list(string)
#   default = ["10.35.1.0/24", "10.35.2.0/24", "10.35.3.0/24"]
# }

variable "public_cidrs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    subnet1 = {
      cidr_block        = "10.35.1.0/24"
      availability_zone = "us-east-1a"
    },
    subnet2 = {
      cidr_block        = "10.35.2.0/24"
      availability_zone = "us-east-1b"
    },
  }
}

variable "private_cidrs" {
  type    = list(string)
  default = ["10.35.30.0/24", "10.35.40.0/24", "10.35.50.0/24"]
}

variable "environment" {
  description = "Enter Environment Name"
  type = string
}
