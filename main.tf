provider "aws" {
  region = "ap-northeast-1"
  profile = "Raut"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "practice key"
  associate_public_ip_address = true

  tags = {
    Name = "devops-instance"
  }

  provisioner "local-exec" {
    command = "echo [web] > ../ansible/inventory && echo ${self.public_ip} >> ../ansible/inventory"
  }
}
