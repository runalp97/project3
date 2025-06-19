output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "instance_private_ip" {
  value = aws_instance.web.private_ip
}

output "instance_public_dns" {
  value = aws_instance.web.public_dns
}

output "subnet_id" {
  value = aws_instance.web.subnet_id
}

output "vpc_id" {
  value = aws_subnet.subnet1.vpc_id
}
