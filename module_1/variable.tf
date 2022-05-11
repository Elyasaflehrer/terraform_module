variable "owner_tag" {
    type = string
    default = "elyasaf-lehrer"
}

variable "region" {
  type = string
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags that will be added to all resources created by Terraform"
}

variable "local_computer_ip"{
  type = string
}

variable "cidr_block_vpc"{
  type = string
}

variable "cidr_block_subnet1"{
  type = string
}

variable "launch_public_ip"{
  type = bool
}

variable "az_1"{
  type = string
}

variable "cidr_block_port_22"{
  type = list(string)
}

variable "cidr_block_egress"{
  type = list(string)
}

variable "ami_ubuntu"{
  type = string
}

variable "instance_type_ubuntu"{
  type = string
}


variable "device_name_master"{
  type = string
}

variable "device_size_master"{
  type = number
}

