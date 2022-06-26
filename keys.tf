resource "aws_key_pair" "iac-key" {
  key_name   = join("-", [terraform.workspace, "iac-key"])
  public_key = file("./iac-pub")
}
