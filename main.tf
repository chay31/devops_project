'("provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0615c24b11768b7dd"  
  key_name      = "chaymaej"

  tags = {
    Name = "DevOps-Instance"
  }

 provisioner "remote-exec" {
  inline = [
    "sleep 30",  # Ajoutez un délai de 30 secondes
    "sudo apt-get update",
    "sudo apt-get upgrade -y"
  ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/jilla/.ssh/id_rsa_new")
      host        = self.public_ip
    }
  }
}

output "instance_ip" {
  value = aws_instance.ubuntu.public_ip
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
")'