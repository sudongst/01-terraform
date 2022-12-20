provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

variable "user_names" {
description = "Create IAM users with these names"
type = list(string)
default = ["aws18-neo", "aws18-trinity", "aws18-morpheus"]
}
