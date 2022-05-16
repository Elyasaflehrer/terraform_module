variable "owner_tag" {
    type = string
    default = "elyasaf-lehrer"
}

variable "alb_subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags that will be added to all resources created by Terraform"
}

variable "ami_instance" {
  type = string
}
 
variable "instance_type" {
  type = string
}

variable "associate_public_ip_address" {
  associate_public_ip_address = bool
}

variable "load_balancer_type" {
  load_balancer_type = string
}

variable "cidr_block_route_table" {
  type = string
}

variable "cidr_blocks_ssh" {
  type = list(string)
}

variable "cidr_blocks_egress" {
  type = list(string)
}

variable "cidr_block_subnet1" {
  type = string
}

variable "cidr_block_subnet2" {
  type = string
}

variable "region_subnet1" {
  type = string  
}
variable "region_subnet2" {
  type = string  
}
variable "cidr_block_vpc" {
  type = string
}