variable "ami_id" {
    type=string
    default="ami-0220d79f3f480ecf5"
    description ="AMI ID for EC2 instances"
}

variable "instance_type"{
  default = "t3.small"
  description = "EC2 Size"
  type = string
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Valid values for instance_types are: (t3.micro, t3.small, t3.medium)."
  }         
}

variable "sg_ids" {
    type= list
}

variable "tags" {
    type=map
}