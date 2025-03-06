data "aws_ami" "ami_id" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-ecs-kernel-5.10-inf-hvm-2.0.20241108-x86_64-ebs"]
  }
}


output "id" {
    value = data.aws_ami.ami_id
  
}

data "aws_vpc" "vpc" {
    
    default = true
  
}

output "vpc_info" {

    value = data.aws_vpc.vpc
  
}
resource "aws_security_group" "add_vpc" {
    name = var.security_group_name
    vpc_id = data.aws_vpc.vpc.id
    description = "allow all port 80"

    ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.securityg_group_cidr
  
}
egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.securityg_group_cidr
    
  }
  
}