output "ip_publico" {
    value = aws_instance.Ec2-Terraform.public_ip
}

output "dns_publico" {
    value = aws_instance.Ec2-Terraform.public_dns
}