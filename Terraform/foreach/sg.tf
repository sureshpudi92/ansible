resource "aws_security_group" "roboshop" {
    name = "Roboshop"
    description = "allow HTTP HTTPS SSH ports"

     dynamic ingress{
        for_each = var.ingress
content {
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    description = ingress.value["description"]
    cidr_blocks = ingress.value.cidr_blocks
  
        }
    }
     
      
egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = [ "::/0" ]
    
  }
  tags = {
    name = "roboshop"
  }

}