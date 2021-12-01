provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

terraform {
  backend "s3" {
    profile = "default"
    bucket  = "terraformstatecode3"
    key     = "task/terraform.tfstate"
    region  = "us-east-1"

  }
}

module "vpc" {
  source = "./modules/vpc"

}



module "ec2_webserver" {
  source          = "./modules/ec2_webserver"
  security_groups = module.SG.security_groups_webserver
  public_subnet   = element(module.vpc.public_subnet, 1 )



}

module "SG" {
  source = "./modules/SG"
  vpc_id = module.vpc.vpc_id
}


module "s3"{
source = "./modules/s3"


}
