# resource "null_resource" "public_server" {
#   provisioner "file" {
#     source      = "script.sh"
#     destination = "/tmp/script.sh"
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("nginx.pem")
#       host        = element(aws_instance.web-1.*.public_ip, count.index)
#     }
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod 700 /tmp/server-script.sh",
#       "sudo ./tmp/server-script.sh",
#       "sudo yum update -y",
#       "sudo yum install nginx -y",
#       "sudo service nginx start"

#     ]
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("nginx.pem")
#       host        = aws_instance.web-1.0.public_ip
#     }
#   }
# }
