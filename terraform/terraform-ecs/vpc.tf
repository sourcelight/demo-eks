
# the default vpc is already connected to the internet so we don't need to create a new one
resource "aws_default_vpc" "ecs-vpc" {
  tags = {
    Name = "ECS-VPC"
  }
}

resource "aws_default_subnet" "ecs_az1" {
  availability_zone = "us-east-1a"

  tags = {
    Name = "Default subnet for us-east-1a"
  }
}

resource "aws_default_subnet" "ecs_az2" {
  availability_zone = "us-east-1b"

  tags = {
    Name = "Default subnet for us-east-1b"
  }
}

resource "aws_default_subnet" "ecs_az3" {
  availability_zone = "us-east-1c"

  tags = {
    Name = "Default subnet for us-east-1c"
  }
}

resource "aws_security_group" "allow_http" {
  vpc_id = aws_default_vpc.ecs-vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}










#To make ti working the code below I should add a gateway and a route table to the vpc and a subnet to the vpc
## Create a VPC
#resource "aws_vpc" "main" {
#  cidr_block           = "10.0.0.0/16"
#  enable_dns_support   = true # Enable DNS support
#  enable_dns_hostnames = true # Enable DNS hostnames
#
#  # Tags to identify the VPC
#  tags = {
#    Name = "vpc-ecs" # Replace with your desired name
#  }
#
#
#}
#
## Create a public subnet
#resource "aws_subnet" "public" {
#  vpc_id                  = aws_vpc.main.id
#  cidr_block              = "10.0.1.0/24"
#  map_public_ip_on_launch = true # Enable public IP assignment
#}
#
## Create a Security Group to allow HTTP traffic
#resource "aws_security_group" "allow_http" {
#  vpc_id = aws_vpc.main.id
#
#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from anywhere
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1" # Allow all outbound traffic
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}