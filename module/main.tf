
resource "aws_instance" "instance" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = var.components
  }
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.dnsrecords]

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = aws_instance.instance.private_ip
  }

  provisioner "remote-exec" {
    inline = [
      "rm -rf roboshop_shell1",
      "git clone https://github.com/rajace7/roboshop_shell1.git",
      "cd roboshop_shell1",
      "sudo bash ${var.components}.sh  ${var.password}"
    ]
  }
}

resource "aws_route53_record" "dnsrecords" {

  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "${var.components}-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}



