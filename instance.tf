provider "aws" {
  profile = "default"
  version = "~> 2.70"
  region  = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-05655c267c89566dd"
  instance_type = "t2.micro"
  key_name      = "tucson1453"
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true  
  


  tags = {
    Name = "Web Server"
  }  
  

  
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
 }


}
 