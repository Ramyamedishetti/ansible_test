resource "aws_vpc" "management_zone" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Management-zone"
  }
}