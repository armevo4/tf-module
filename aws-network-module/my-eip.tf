resource "aws_eip" "my-eip" {
  vpc    = true 

  tags = {
    Name = var.eip_Name 
  }
}