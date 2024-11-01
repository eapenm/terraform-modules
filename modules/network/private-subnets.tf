resource "aws_subnet" "private-subnets" {
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"

  }
}