# Query all avilable Availibility Zone
data "aws_availability_zones" "available" {}

module "my_vpc_module" {
  count              = 2
  source             = "./modules/network"
  environment        = "dev"
  availability_zones = data.aws_availability_zones.available.names[count.index]
}

module "my_server_module" {
  depends_on = [
    module.my_vpc_module
  ]
  source             = "./modules/webserver"
  environment        = "dev"
  subnet_id          = element(module.my_vpc_module.public_cidrs.*.id, 0)
  security_group_ids = module.my_vpc_module.security_group_ids.*.id
  availability_zones = data.aws_availability_zones.available
}