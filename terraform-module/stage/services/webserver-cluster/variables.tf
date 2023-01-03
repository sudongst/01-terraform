variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
  default = "aws18-terraform-state"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
  defalut = "stage/data-stores/mysql/terraform.tfstate"
}

variable "cluster_name" {
  description = "네[임"
  type = string
  default = "aws18-webservers-stage"
}
