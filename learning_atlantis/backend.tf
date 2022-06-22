
terraform {
  backend "s3" {
    bucket = "tfstate-elyasaf.lehrer"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "tfstate-elyasaf.lehrer" 
  }
}