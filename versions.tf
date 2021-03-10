terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 3.31"
}

provider "random" {
  version = "~> 3.1"
}
