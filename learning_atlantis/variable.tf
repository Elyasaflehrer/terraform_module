variable "owner_tag" {
    type = string
    default = "elyasaf-lehrer"
}

variable "project_name_tag" {
    type = string
    default = "project_name_tag"
}

variable "region" {
  type = string
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags that will be added to all resources created by Terraform"
}

variable "cidr_block_vpc"{
  type = string
}

variable "cidr_block_subnet1"{
  type = string
}

variable "cidr_block_subnet2"{
  type = string
}

variable "launch_public_ip"{
  type = bool
}

variable "az_1"{
  type = string
}

variable "az_2"{
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

variable "port_alb_leastiner_http"{
  type = number
}

variable "protocol_alb_leastiner_http"{
  type = string
}

variable "route53_zone_domain_name"{
  type = string
}

variable "port_tg_1"{
  type = number
}

variable "protocol_tg_1"{
  type = string
}

variable "port_tg_port_4141"{
  type = number
}

variable "protocol_tg_port_4141"{
  type = string
}
