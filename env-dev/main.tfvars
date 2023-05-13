application_servers = {

  frontend = {
    instance_type = "t3.micro"
    name          = "frontend"
  }

  catalogue = {
    instance_type = "t3.micro"
    name          = "catalogue"
  }
    user = {
    instance_type = "t3.micro"
    name          = "user"
  }
  cart = {
    instance_type = "t3.micro"
    name          = "cart"
  }

  shipping = {
    instance_type = "t3.micro"
    name          = "shipping"
    password      = "RoboShop@1"
  }

  payment = {
    instance_type = "t3.micro"
    name          = "payment"
    password      = "roboshop123"
  }


}

database_servers = {

mongod = {
  instance_type = "t3.micro"
  name          = "mongod"
}
redis = {
  instance_type = "t3.micro"
  name          = "redis"
}
mysql = {
  instance_type = "t3.micro"
  name          = "mysql"
  password      = "RoboShop@1"
}
rabbitmq = {
  instance_type = "t3.micro"
  name          = "rabbitmq"
  password      = "roboshop123"
}

}

env = "dev"





