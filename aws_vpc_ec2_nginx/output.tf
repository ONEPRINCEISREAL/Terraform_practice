output "instance_public_ip" {
    description = "The public IP address of Ec2 instance"
    value       = aws_instance.niginx_server.public_ip
}

output "instance_url" {
    description = "The URL to access the nginx server"
    value       = "http://${aws_instance.niginx_server.public_ip}"
}