provider "aws" {
  region = "ap-south-1"
}

# Reuse existing VPC
data "aws_vpc" "existing" {
  id = "vpc-02c0842f98e27f4e6"
}

# Reuse existing public subnet
data "aws_subnet" "existing" {
  id = "subnet-0cbba03e4b0449c01"
}

# Reuse existing security group
data "aws_security_group" "web_sg" {
  id = "sg-0aa976a5e1e25c00d"
}

# Create EC2 web server
resource "aws_instance" "web_server" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type           = "t2.micro"
  subnet_id               = data.aws_subnet.existing.id
  vpc_security_group_ids  = [data.aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2

              echo "<h1>Capstone Project 1 - Terraform EC2 Web Server</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "capstone-web-server"
  }
}
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web_server.id
}

output "public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web_server.public_ip
}

output "website_url" {
  description = "URL of the deployed website"
  value       = "http://${aws_instance.web_server.public_ip}"
}
