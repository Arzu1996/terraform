resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "phone-book-vpc"
  }
}
resource "aws_subnet" "front-public-subnet-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "front-public-subnet-2" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "back-private-subnet-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "back-private-subnet-2" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"
}