resource "aws_subnet" "main" {
  count      = length(var.cidr_block)
  vpc_id     = aws_vpc.vpc_id
  cidr_block = element(var.cidr_block, count.index)
  availability_zone_id = element(var.az, count.index)
  tags = merge({
    Name = "${var.env}-web-subnet"
  },
    var.tags)
}