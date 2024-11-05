terraform {
  backend "s3" {
    bucket         = "doorfeed-s3-bucket"              
    key            = "terraform/state/terraform.tfstate"   
    region         = "eu-west-2"                      
    dynamodb_table = "tf-statelock-doorfeed"         
    encrypt        = true                                     
  }
}
