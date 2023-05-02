data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow_all" {
  name = "allow_all"
}


variable "instance_type" {
  default = "t3.micro"
}

variable "components" {
  default = [ "frontend", "mongodb", "catalogue"]
}


resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type

  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = var.components[count.index]
  }
}

/*
resource "aws_route53_record" "frontend" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "frontend-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

output "frontend" {
  value = aws_instance.frontend.public_ip
}

resource "aws_instance" "mongod" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "mongod"
  }
}

resource "aws_route53_record" "mongod" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "mongod-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongod.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "catalogue-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "redis-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "user-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "cart-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "mysql-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "shipping-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "rabbitmq-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "payment-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "dispatch" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z04548223K1NBBTA1AB3D"
  name    = "dispatch-dev.rpadaladevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.dispatch.private_ip]
}
*/