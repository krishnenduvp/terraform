provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec1_test" {
  ami           = "ami-06a0b4e3b7eb7a300"
  instance_type = "t2.micro"
  tags = {
    Name = "webserver_test"
  }
}

