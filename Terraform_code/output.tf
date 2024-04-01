output "vpc_id" {
  value = aws_vpc.diatoz_vpc.id
}
output "public_subnet_id" {
  value = aws_subnet.diatoz_public_subnet.id
}
output "private_subnet_id" {
  value = aws_subnet.diatoz_private_subnet.id
}
output "public_instance_id" {
  value = aws_instance.diatoz_public_instance.id
}
