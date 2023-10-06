
output "ec2_public-ip" {
    value = aws_instance.ec2-demo.public_ip
  
}

output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "splunk_security_group_id" {
  value = aws_security_group.sg-demo.id
}


