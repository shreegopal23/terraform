# to create ec2 we need sg vpc and key pair
# key pair
resource "aws_key_pair" "deployer" {
  key_name = "aws-terra-key"
    public_key = file("terra-key.pub")
}
# default VPC
resource "aws_default_vpc" "default" {
  
}
# sg
resource "aws_security_group" "tfsecurity" {
    name = "allowPorts"
    description = "to open ports for ec2"
    vpc_id = aws_default_vpc.default.id #interpolation
    # incomming traffic
    ingress {
        description = "this is for ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    # outgoing traffic
    egress {
        description = "this is for outging request"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

resource "aws_instance" "My-instance" {
    ami = var.ec2-ami
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    security_groups = [ aws_security_group.tfsecurity.name ]
    tags = {
      "name" = "terra-automate"
    }
}