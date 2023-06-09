resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = var.aws_pub_key
}

resource "aws_instance" "vm" {
  ami           = "ami-006dcf34c09e50022" #ami us-east-1
  instance_type = "t2.micro"
  key_name      =  aws_key_pair.key.key_name
  subnet_id     =  data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids = [lookup(data.terraform_remote_state.vpc.outputs, "security_group_id", null)]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}