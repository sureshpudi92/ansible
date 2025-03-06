
resource "aws_key_pair" "deployer" {
  key_name   = var.public_key
  public_key = file("${path.module}/devopsqa.pub")
}

resource "aws_instance" "my-server" {
    ami = var.ami_id # devops-practice
    instance_type = var.instance_type
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.Allow-All.name]

    tags = var.tags
  
}