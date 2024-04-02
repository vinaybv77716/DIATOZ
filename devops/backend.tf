terraform {
 backend "s3" {
   bucket = "diatozvinay"
   region = "us-east-1"
   key = "terraform.tfstate"
 }
}