resource "aws_s3_bucket" "example" {
  bucket = "my-s3-bucket-terraform-state-store"

  tags = {
    Name        = "My s3 bucket"
    Environment = "Dev"
    Environment = "staging"
    Environment = "prod"
  }
}
