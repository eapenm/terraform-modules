resource "aws_subnet" "private-subnet" {
  #   count             = 3 #012
  count             = length(var.private_cird_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_cird_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"

  }
}