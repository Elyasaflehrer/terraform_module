variable "common_tags" {
  type        = map(string)
  description = "Common tags that will be added to all resources created by Terraform"
}

variable "owner_tag" {
    type = string
    default = "elyasaf-lehrer"
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
variable "az_a" {
  type = string
}
variable "az_b" {
  type = string
}
variable "az_c" {
  type = string
}
variable "cidr_block_pub_sup_a" {
  type = string
}
variable "cidr_block_pri_sup_b" {
  type = string
}
variable "cidr_block_pri_sup_c" {
  type = string
}


# INSTANE
variable "ami_instance"{
 type = string
}
variable "type_instance"{
 type = string
}

variable "public_key_pair"{
  type = string
}
