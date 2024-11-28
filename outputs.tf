output "my-ec2" {
  value = aws_instance.My-instance.public_ip
}