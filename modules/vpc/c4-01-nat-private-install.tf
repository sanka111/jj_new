##resource "aws_nat_gateway" "private_nat_gateway" {
##  connectivity_type = "private"
##  
##  subnet_id         = module.vpc.private_subnets[2]
##}