
resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id # clLeft and right side name no need to be same
  vpc_security_group_ids = [aws_security_group.Allow_All.id]
  instance_type          = lookup(var.instance_type, terraform.workspace) # var.instance_type[var.environment]

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}-${var.instances[count.index]}-${terraform.workspace}" # Need name like roboshop-catalogue-dev
      Component   = var.instances[count.index]
      Environment = terraform.workspace
    }

  )
}

resource "aws_security_group" "Allow_All" {
  name        = "${var.project}-${var.sg_name}-${terraform.workspace}" # Need name like roboshop-allow_all-dev
  description = var.sg_description

  ingress {
    from_port        = var.from_port
    to_port          = var.To_port
    protocol         = var.protocol # Allows all traffic
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }
  egress {
    from_port        = var.from_port
    to_port          = var.To_port
    protocol         = var.protocol #ALL traffic
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.sg_name}-${terraform.workspace}"
    }
  )
} 