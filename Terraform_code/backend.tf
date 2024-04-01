terraform {
 backend "s3" {
   bucket = "diatozterraform"
   region = "us-east-1"
   key = "diatoz/terraform.tfstate"
 }
}
