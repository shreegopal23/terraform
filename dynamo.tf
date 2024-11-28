resource "aws_dynamodb_table" "my-db" {
  name = var.dynamo-table
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
}