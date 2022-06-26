resource "aws_instance" "data-ec2" {
  ami           = data.aws_ami.amazon-linux2-ami.id 
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = aws_key_pair.iac-key.key_name
  vpc_security_group_ids = [aws_security_group.my-sg.id]
 
 
  #provisioner "local-exec" {
  #  command = "echo 'ipconfig'"
  #}

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("iac-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo chown -R ec2-user:ec2-user /usr/share/nginx/html",
    ]
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/usr/share/nginx/html/index.html"
  }

  tags = {
    Name = join("-", [var.project-name, "HelloWorld"])
  }
}
