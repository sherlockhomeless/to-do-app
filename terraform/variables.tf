variable "aws_region" {
  default = "us-east-1"
}

variable "subnets" {
  default = ["subnet-0b1c442024c095ec9", "subnet-039d7bd1c43f973cc", "subnet-0639992b937e38085"]
}

variable "vpc" {
  default = "vpc-0f82992e109fea8f9"
}

variable "cluster-name" {
  default = "g1_cluster"
  type    = string
}

variable "tf-bucket-name" {
  default = "g1-s3-bucket-tf"
}
