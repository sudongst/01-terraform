terraform {
  required_version = ">= 1.0.0, < 2.0.0"
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
  ami           = "ami-07d16c043aa8e5153"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  # user_data 인수를 설정하여 쉘스크립트를 사용자 데이터로 전달한다.
  # 테라폼의 히어닥 구문을 이용해 줄바꿈 문자를 삽입하지 않고도 여러줄로 된 코드를 작성한다.
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup busybox httpd -f -p 8080 &
    EOF

  #tags 추가
  tags = {
    Name = "aws18-terraform-example"
  }
}

#Public IP 출력
output "public-ip" {
  value       = aws_instance.example.public_ip
  description = "인스턴스의 퍼블릭 아이피"
}

# 보안그룹 설정 8080포트 Open
resource "aws_security_group" "instance" {
  name = "aws18-terrafrom-example-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

