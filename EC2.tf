
resource "aws_instance" "this" {
  ami                = var.ami_id # clLeft and right side name no need to be same
  vpc_security_group_ids = var.sg_ids
  instance_type          = var.instance_type
  tags = var.tags
}
