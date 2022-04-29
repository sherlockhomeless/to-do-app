// https://kumargaurav1247.medium.com/terraform-state-shared-storage-for-state-files-how-to-manage-7912907436b7
resource "aws_s3_bucket" "tf-state" {
  bucket = var.tf-bucket-name
  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "tf-lock" {
  hash_key = "LockID"
  name     = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket = "g1-s3-bucket-tf"
    key = "g1/s3/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

