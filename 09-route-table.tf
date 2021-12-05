resource "aws_route_table" "front-public" {
  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
}
resource "aws_route_table" "back-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Nat-Gateway-1.id
  }

}

resource "aws_route_table_association" "public1" {

  subnet_id = aws_subnet.front-public-subnet-1.id
  route_table_id = aws_route_table.front-public.id
}

resource "aws_route_table_association" "public2" {

  subnet_id = aws_subnet.front-public-subnet-2.id
  route_table_id = aws_route_table.front-public.id
}


resource "aws_route_table_association" "private1" {

  subnet_id = aws_subnet.back-private-subnet-1.id
  route_table_id = aws_route_table.back-private.id
}

resource "aws_route_table_association" "private2" {

  subnet_id = aws_subnet.back-private-subnet-2.id
  route_table_id = aws_route_table.back-private.id
}