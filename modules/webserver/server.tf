# Query all avilable ami from api
data "aws_ami" "latest-amazon-linux-image" {

  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "proj" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true
  availability_zone          = var.availability_zones
  iam_instance_profile = var.iam_instance_profile
  user_data = file("${path.module}/server-script.sh")

  tags = {
    Name = "${var.environment}-server"
  }
}
