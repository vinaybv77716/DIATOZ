variable "cidr" {
  default = "10.0.0.0/16"
  description = "this is cidr for vpc"
}
variable "public_subnet_cidr" {
  default = "10.0.0.0/20"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "private_subnet_cidr" {
  default = "10.0.16.0/20"
}
variable "diatoz_instance_type" {
  default = "t2.micro"
}
variable "diatoz_ami" {
  default = "ami-080e1f13689e07408"
}
