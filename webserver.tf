resource "aws_instance" "webserver_ec2" {
  ami           = "ami-011a9944eb4abcf55"
  instance_type = var.ec2_type #"${var.ec2_type}"
  key_name      = "india"
  tags = {
    Name = "webby"
  }
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = <<EOF
    #! /bin/bash
    mkdir /tmp/krish
    /bin/echo "Welcome" > "/var/www/html/index.php"
 EOF

}

resource "aws_security_group" "web_sg" {
  name = "webserver 80"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
