
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "firstsubnet" {
  vpc_id = aws_vpc.management_zone.id
  cidr_block = "10.0.0.0/17"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnetA"
  }
}

resource "aws_subnet" "secondsubnet" {
  vpc_id = aws_vpc.management_zone.id
  cidr_block = "10.0.128.0/18"
  availability_zone = "us-east-1b"
  tags = {
    Name = "subnetB"
  }
}

resource "aws_subnet" "thirdsubnet" {
  vpc_id = aws_vpc.management_zone.id
  cidr_block = "10.0.192.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "subnetC"
  }
}

resource "aws_subnet" "fourthsubnet" {
  vpc_id = aws_vpc.management_zone.id
  cidr_block = "10.0.224.0/19"
  availability_zone = "us-east-1d"
  tags = {
    Name = "subnetD"
  }
}


