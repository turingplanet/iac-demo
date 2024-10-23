terraform {
  backend "s3" {
    bucket         = "terraform-state"
    key            = "test/state"  # path to store the state file
    region         = "us-west-1"
    encrypt        = true
  }
}

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
