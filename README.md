# Terraform-EC2-Instances

##Inputs

*ami-id(Optinal): AMI-ID used by user
*instance_type(optional): Valid values for instance_types are: (t3.micro, t3.small, t3.medium)."
            default is: t3.small
*sg_ids(required): a list security group Id's attached.
*tags(required): a map of EC2 Details

##Outputs
*public_ip
*private_ip
*ami_id
