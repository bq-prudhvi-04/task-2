resource "aws_s3_bucket" "my_bucket_demo" {
  bucket = "mydemobucket12389"
  acl    = "private"

  tags = {
    Name        = "mydemobucket12389"

  }