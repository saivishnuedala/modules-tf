data "aws_availability_zones" "available" {}
# VPC Creation
resource "aws_vpc" "play" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.environment}-vpc"
  }
}
# Public Subnet
# resource "aws_subnet" "public_subnet" {
#   count                   = length(var.public_cidrs)
#   # cidr_block              = var.public_cidrs[count.index]
#   cidr_block = element(var.public_cidrs, count.index)
#   vpc_id                  = aws_vpc.play.id
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.available.names[count.index]

#   tags = {
#     Name = "${var.environment}-pub-subnet-${count.index + 1}"
#     Tier = "Public"
#   }
# }

resource "aws_subnet" "public_subnet" {
    for_each = var.public_cidrs

  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  vpc_id            = aws_vpc.play.id
    # availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.environment}-pub-subnet"
    Tier = "Public"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  count      = length(var.private_cidrs)
  cidr_block = var.private_cidrs[count.index]
  vpc_id     = aws_vpc.play.id
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.environment}-pri-subnet-${count.index + 1}"
    Tier  = "Private"
  }
}

# # Creating Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.play.id

#   tags = {
#     Name = "${var.environment}-ig"
#   }
# }

# # Public Route Table
# resource "aws_route_table" "public_route" {
#   vpc_id = aws_vpc.play.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "${var.environment}-rt-pubic"
#   }
# }

# # Private Route Table
# resource "aws_route_table" "private_route" {
#   vpc_id = aws_vpc.play.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.ngw.id
#   }

#   tags = {
#     Name = "${var.environment}-rt-private"
#   }
# }

# # EIP
# resource "aws_eip" "eip_nat" {
#   vpc = true
# }

# # NAT Gateway
# resource "aws_nat_gateway" "ngw" {
#   allocation_id = aws_eip.eip_nat.id
#   subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
#   tags = {
#     Name = "${var.environment}-ng"
#   }
# }

# # Associate Public Subnet with Public Route Table
# resource "aws_route_table_association" "public_subnet_assoc" {
#   count          = length(aws_subnet.public_subnet)
#   route_table_id = aws_route_table.public_route.id
#   subnet_id      = aws_subnet.public_subnet.*.id[count.index]
#   # depends_on     = [aws_route_table.public_route, aws_subnet.public_subnet]
# }

# # Associate Private Subnet with Private Route Table
# resource "aws_route_table_association" "private_subnet_assoc" {
#   count          = length(aws_subnet.private_subnet)
#   route_table_id = aws_route_table.private_route.id
#   subnet_id      = aws_subnet.private_subnet.*.id[count.index]
#   # depends_on     = [aws_route_table.private_route, aws_subnet.private_subnet]
# }

# # Security Group Creation
# resource "aws_security_group" "test_sg" {
#   name   = "my-test-sg"
#   vpc_id = aws_vpc.play.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.environment}-sg"
#   }
# }