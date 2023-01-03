provider "aws" {
  region = "ap-northeast-2"
}

/*
다른 VPC를 사용하려면
data "aws_vpc" "project-vpc" {
	id = "<사용하려는 vpc id>"
	filter {
		name = "tag:Name"
		value = ["procject-VPC"]
		}
}
*/  


data "aws_vpc" "default" {
  default = true
}

output "vpc-id" {
  value = data.aws_vpc.default.id
}

output "vpc-ids" {
  value = [data.aws_vpc.default.cidr_block]
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

