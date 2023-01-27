# Terraform Configure setting block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/oic"
      
    }
  }
}

# Provider Block
provider "oic" {
  profile = "default" 
  region  = "us-central "
}

#Resource Block
resource "aws_instance" "ec2testserver" {
  ami           = "ami-041db4a969fe3eb68" 
  instance_type = "oracle instance "

}


# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-1a"]
  private_subnets     = ["10.0.1.0/24"]
  public_subnets      = ["10.0.101.0/24"]

#new comment added 
