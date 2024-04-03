terraform {
 backend "s3" {
   bucket = "diatozterraform1"
   region = "us-east-1"
   key = "diatoz/terraform.tfstate"
 }
}
