provider "aws" {
  default_tags { tags = var.common_tags }
  region = var.region
}
