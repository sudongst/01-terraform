terraform {
  # Terraform 버전 지정
  required_version = ">= 1.0.0, < 2.0.0"
  # 공급자 지정
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-07d16c043aa8e5153" # Ubuntu 20.04
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  key_name = "aws18-key"

  user_data = <<-EOiF
}
