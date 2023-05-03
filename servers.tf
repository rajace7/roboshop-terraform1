data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow_all" {
  name = "allow_all"
}


/*variable "instance_type" {
  default = "t3.micro"*/


variable "components" {
  default = {
    frontend = {
      instance_type = "t3.micro"
      name = "frontend"
    }
    mongodb = {
      instance_type = "t3.micro"
      name = "mongodb"
    }
    catalogue = {
      instance_type = "t3.micro"
      name = "catalogue"
    }
    redis = {
      instance_type = "t3.micro"
      name = "redis"
    }
    user = {
      instance_type = "t3.micro"
      name = "user"
    }
    cart = {
      instance_type = "t3.micro"
      name = "cart"
    }
    mysql = {
      instance_type = "t3.micro"
      name = "mysql"
    }
    shipping = {
      instance_type = "t3.micro"
      name = "shipping"
    }
    payment = {
      instance_type = "t3.micro"
      name = "payment"
    }
    dispatch = {
      instance_type = "t3.micro"
      name = "dispatch"
    }
  }

}


resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "dnsrecords" {
  for_each = var.components
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "${each.value["name"]}-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}



