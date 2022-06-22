provider "aws" {
  default_tags { tags = var.common_tags }
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tfstate-elyasaf.lehrer/states/udemy_course/private_link/"
    key    = "private_link.tfstate"
    region = "eu-central-1"
    dynamodb_table = "tfstate-elyasaf.lehrer" 
  }
}