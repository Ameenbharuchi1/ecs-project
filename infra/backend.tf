terraform {
  required_version = ">= 1.0.0" 
  backend "s3" {
    bucket         = "doorfeed-s3-bucket"              
    key            = "terraform/state/terraform.tfstate"   
    region         = "eu-west-2"                          
    encrypt        = true                                     
  }
}
