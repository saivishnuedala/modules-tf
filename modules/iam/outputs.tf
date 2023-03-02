output "rolename" {
  value = "{aws_iamrole.ec2_role.name}"
}

output "rolearn" {
  value = "{aws_iamrole.ec2_role.arn}"
}

output "instanceprofilename" {
  value = "{aws_iam_instance.server-profile.name}"
}