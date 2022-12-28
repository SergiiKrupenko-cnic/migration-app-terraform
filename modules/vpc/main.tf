resource "aws_vpc" "this" {
  cidr_block       = var.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "migration-app-vpc"
  }
}


resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet
  availability_zone       = var.az

  tags = {
    Name = format("public subnet in -%s", var.az)
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "public_gw"
  }
}
/*resource "aws_subnet" "private" {
  

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet
  availability_zone = var.az

  tags = {
    Name = format("private subnet in -%s", var.az)
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
  tags = {
    Name = "nat_eip"
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public.id
  tags = {
    Name = "nat_gw"
  }
}
*/
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

/*resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = format("private route table in -%s", var.az)
  }
}
*/
resource "aws_route_table_association" "custom-rtb-public-subnet" {

  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public.id
}

/*resource "aws_route_table_association" "custom-rtb-private-subnet" {

  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private.id
}*/
