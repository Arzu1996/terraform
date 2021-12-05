resource "aws_nat_gateway" "Nat-Gateway-1" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.front-public-subnet-1.id
  depends_on = [aws_internet_gateway.internet-gateway]
  tags = {
    Name = "Public Nat Gateway 1"
  }
}


resource "aws_nat_gateway" "Nat-Gateway-2" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.front-public-subnet-2.id
  depends_on = [aws_internet_gateway.internet-gateway]
  tags = {
    Name = "Public Nat Gateway 2"
  }
}