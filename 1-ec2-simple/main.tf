provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-0e3aaca08a8973983"
  instance_type = "t4g.micro"

  tags = {
    Name = "IaC-Demo-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
