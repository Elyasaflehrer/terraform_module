variable "common_tags" {
  type        = map(string)
  description = "Common tags that will be added to all resources created by Terraform"
}

variable "owner_tag" {
    type = string
    default = "elyasaf-lehrer"
}

variable "Project_name" {
    type = string
    default = "elyasaf-lehrer"
}


variable "my_publicIp"{
  type = string
}

variable "region" {
  type = string
}


# VPC 
variable "cidr_block_vpc_a"{
  type = string
}

variable "cidr_block_vpc_b"{
  type = string
}



# SUBNETS
variable "cidr_block_pub_sub_a"{
  type = string
}

variable "cidr_block_pri_sub_b"{
  type = string
}

variable "cidr_block_pri_sub_c"{
  type = string
}
variable "cidr_block_pri_sub_d"{
  type = string
}


# AVAILABILITY ZONE
variable "az_a"{
  type = string
}

variable "az_b"{
  type = string
}




variable "ami_instance"{
  type =string
}


variable "instance_type"{
  type = string
}

