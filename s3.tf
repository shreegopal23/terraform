resource "aws_s3_bucket" "my-tf-bucket" {
    bucket = "terraform-learning-shree2392"
    tags = {
      "Name" = "terraform-learning-shree2392"
    }
}