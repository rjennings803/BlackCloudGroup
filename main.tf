provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "black_cloud_group" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "black cloud group"
  }
}

resource "aws_internet_gateway" "BCGIGW" {
  vpc_id = aws_vpc.black_cloud_group.id

}

output "vpc_id" {
  value       = aws_vpc.black_cloud_group.id
  description = "vpc_id"
  sensitive   = false
}
