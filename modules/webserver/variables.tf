variable "instance_type" {
  default = "t2.micro"
}

variable "environment" {
  description = "dev env"
}

variable "subnet_id" {
  description = "VPC Subnet ID's to launch in"
  type        = any
}

variable "security_group_ids" {
  description = "List of security groups ID's associated with"
  type        = list(any)
}

variable "availability_zones" {
  description = "AZ to start the instance in"
  type        = string
}
