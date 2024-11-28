variable "dynamo-table" {
  type = string
  default = "tf-table"
  description = "table name for db"
}

variable "ec2-ami" {
  type = string
  default = "ami-0dee22c13ea7a9a67"
  description = "ami for ec2(ubuntu)"
}