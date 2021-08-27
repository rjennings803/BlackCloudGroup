resource "aws_eip" "BCGeIP" {
  vpc = true

}

resource "aws_nat_gateway" "BCGnat" {
  allocation_id = aws_eip.BCGeIP.id
  subnet_id     = aws_subnet.public_subnet1.id
  depends_on = [
    aws_internet_gateway.BCGIGW
  ]

}