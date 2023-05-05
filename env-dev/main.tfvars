components = {

  frontend = {
    instance_type = "t3.micro"
    name          = "frontend"
  }
  mongod = {
    instance_type = "t3.micro"
    name          = "mongod"
  }
  catalogue = {
    instance_type = "t3.micro"
    name          = "catalogue"
  }
  redis = {
    instance_type = "t3.micro"
    name          = "redis"
  }
  user = {
    instance_type = "t3.micro"
    name          = "user"
  }
  cart = {
    instance_type = "t3.micro"
    name          = "cart"
  }
  mysql = {
    instance_type = "t3.micro"
    name          = "mysql"
    password      = "RoboShop@1"
  }
  shipping = {
    instance_type = "t3.micro"
    name          = "shipping"
    password      = "RoboShop@1"
  }
  rabbitmq = {
    instance_type = "t3.micro"
    name          = "rabbitmq"
    password      = "roboshop123"
  }
  payment = {
    instance_type = "t3.micro"
    name          = "payment"
    password      = "roboshop123"
  }
  dispatch = {
    instance_type = "t3.micro"
    name          = "dispatch"
  }

}

env = "dev"





