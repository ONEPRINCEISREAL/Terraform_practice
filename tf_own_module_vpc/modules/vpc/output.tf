#VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  #To format the subnet IDs which may be multiples in format of subnet_name ={id=,az=}
  public_subnet_output ={
    for key, config in local.public_subnet:key => {
        subnet_id = aws_subnet.main
        az = aws_subnet.main[key].availability_zone
        }
     }
     private_subnet_output ={
    for key, config in local.private_subnet:key => {
        subnet_id = aws_subnet.main
        az = aws_subnet.main[key].availability_zone
        }
     }
}
#Subnets

output "public_subnet" {
  value = local.public_subnet_output
}

output "private_subnet" {
  value = local.private_subnet_output
}

#Route Tables
output "route_table_ids" {
  value = {
    public = aws_route_table.main[*].id
    private = aws_route_table.private[*].id
  }
}

