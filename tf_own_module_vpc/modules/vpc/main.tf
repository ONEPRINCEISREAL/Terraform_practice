resource "aws_vpc" "main" {
  cidr_block = var.vpc_config.cidr_block
  tags = {
    Name = var.vpc_config.name
  }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id
  for_each = var.subnet_config
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = each.value.public 

  tags ={
    key = each.key
    type = each.value.public ? "Public" : "Private"
  }
}

locals {
  public_subnet = {
    for key, config in var.subnet_config : key => config if config.public
  }
  private_subnet = {
    for key, config in var.subnet_config : key => config if !config.public
  }
}
#Internet Gateway
resource "aws_internet_gateway" "main" {
  
  count = length(local.public_subnet) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id
}

#route table for public subnets
resource "aws_route_table" "main" {
  
  count = length(local.public_subnet) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main[0].id
  }
  tags ={
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "main" {
  for_each = local.public_subnet

  subnet_id = aws_subnet.main[each.key].id
  route_table_id = aws_route_table.main[0].id
}

resource "aws_route_table" "private" {
  count = length(local.private_subnet) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags ={
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  for_each = local.private_subnet

  subnet_id = aws_subnet.main[each.key].id
  route_table_id = aws_route_table.private[0].id
}