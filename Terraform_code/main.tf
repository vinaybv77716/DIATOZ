# Creating VPC
resource "aws_vpc" "diatoz_vpc" {
  cidr_block = var.cidr
  tags = {
    name="diatoz_vpc"
  }
}

#Creating public subnet
resource "aws_subnet" "diatoz_public_subnet" {
  vpc_id = aws_vpc.diatoz_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    name="diatoz_public_subnet"
  }
}

#Creating private subnet
resource "aws_subnet" "diatoz_private_subnet" {
  vpc_id = aws_vpc.diatoz_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    name="diatoz_private_subnet"
  }
}

#Creating Internet_gateway
resource "aws_internet_gateway" "diatoz_internet_gateway" {
  vpc_id = aws_vpc.diatoz_vpc.id
  tags = {
    name="diatoz_internet_gateway"
  }
}

#Creating NAT Gateway
resource "aws_nat_gateway" "diatoz_nat_gateway" {
  subnet_id = aws_subnet.diatoz_public_subnet.id
    allocation_id = aws_eip.my_eip.id
}
resource "aws_eip" "my_eip" {
  vpc = true
}

#creating rout Tabel
resource "aws_route_table" "diatoz_rout_tabel" {
  vpc_id = aws_vpc.diatoz_vpc.id
  route {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.diatoz_internet_gateway.id
  }
 
  route {
    cidr_block="0.0.0.0/8"
    gateway_id=aws_nat_gateway.diatoz_nat_gateway.id
  }
  tags = {
    name="diatoz_rout_tabel"
  }
}

#subnet assocation
resource "aws_route_table_association" "siatoz_RT_association" {
  route_table_id = aws_route_table.diatoz_rout_tabel.id
  subnet_id = aws_subnet.diatoz_public_subnet.id
}

# Create a security group
resource "aws_security_group" "diatoz_security_group" {
  name        = "diatoz_security_group"
  description = "Allow inbound SSH and HTTP traffic and ICMPipv4"
    vpc_id = aws_vpc.diatoz_vpc.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "diatoz_public_instance" {
    ami=var.diatoz_ami
  instance_type = var.diatoz_instance_type
  subnet_id = aws_subnet.diatoz_public_subnet.id
  security_groups = [aws_security_group.diatoz_security_group.id]
  tags = {
    Name="public_instance"
  }
}

resource "aws_instance" "diatoz_private_instance" {
    ami=var.diatoz_ami
  instance_type = var.diatoz_instance_type
  subnet_id = aws_subnet.diatoz_private_subnet.id
  security_groups = [aws_security_group.diatoz_security_group.id]
  tags = {
    Name="private_instance"
  }
}
