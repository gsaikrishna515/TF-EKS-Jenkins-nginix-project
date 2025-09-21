data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical's owner ID
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_id

  # The file() function reads the script from the root module's path
  user_data = file("${path.root}/install_jenkins.sh")

  tags = {
    Name = "${var.project_name}-Server"
  }
}
