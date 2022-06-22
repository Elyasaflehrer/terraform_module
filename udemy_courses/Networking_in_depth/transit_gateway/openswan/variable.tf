variable "common_tags" {
  type        = map(string)
  description = "Common tags that will be added to all resources created by Terraform"
}

variable "owner_tag" {
    type = string
    default = "elyasaf-lehrer"
}
variable "my_publicIp"{
  type = string
}

variable "region" {
  type = string
}

variable "cidr_block_vpc_openswan"{
  type = string
}

variable "cidr_block_pub_sub_openswan"{
  type = string
}


variable "az_a"{
  type = string
}



variable "ami_aws_linux"{
  type = string
}


variable "instance_type"{
  type = string
}


variable "pub_key_pair"{
  type = string
}