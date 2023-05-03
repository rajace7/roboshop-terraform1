terraform {
  backend "s3" {
    bucket = "terraform-rpadala"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
