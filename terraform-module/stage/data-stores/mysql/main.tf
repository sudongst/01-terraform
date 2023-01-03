terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }


  backend "s3" {
    #이전에 생성한 버킷 이름으로 변경
    bucket = "aws18-terraform-state"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-northeast-2"

    #이전에 생성한 다이나모 db테이블 이름으로 변경
    dynamodb_table = "aws18-stage-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

# RDS에 대ㅔ이터베이스를 생성한다
resource "aws_db_instance" "example" {
  identifier_prefix = "aws18-terraform-example"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true

  name = var.db_name
  username = var.db_username
  password = var.db_password
}
