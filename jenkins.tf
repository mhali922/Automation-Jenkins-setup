terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.65.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5PG4GWA7HPCNCLEC"
  secret_key = "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"
}


resource "aws_instance" "jenkins_server" {
  ami = "ami-0279c3b3186e54acd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sec-grp.id]
  #iam_instance_profile = "${aws_iam_instance_profile.test1_profile.name}"
  key_name = "sb777"
  user_data = "${file("use_data_jenkins.sh")}"
  tags = {
    Name = "jenkins_server"
  }
}
resource "aws_security_group" "sec-grp" {
  name        = "sec-grp"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-09176c3ac786d2470"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-grp"
  }
}

