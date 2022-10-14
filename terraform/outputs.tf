output "public_ip" {
  description = "Public IP of the server"
  value       = var.use_fixed_ip == true ? aws_eip.this[0].public_ip : module.ec2.public_ip
}
