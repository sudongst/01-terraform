variable "bucket_name" {
  description = "The name of the S3 bucket. must be globally unique."
  type        = string
  default     = "aws18-terraform-state"
}

variable "table_name" {
  description = "The name of the dynamoDB talbe. must be unique in this AWS account."
  type        = string
  default     = "aws18-terraform-locks"
}
