terraform {
  backend "s3" {
    bucket         = "DoorFeed-S3-Bucket"              
    key            = "terraform/state/terraform.tfstate"   
    region         = "eu-west-2"                      
    dynamodb_table = "tf-statelock-doorfeed"         
    encrypt        = true                                     
  }
}
