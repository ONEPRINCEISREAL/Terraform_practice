resource "aws_instance" "niginx_server" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t3.nano"
  subnet_id     = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

     tags = {
        Name = "nginx_server"
     }
}