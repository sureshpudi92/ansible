resource "aws_security_group" "Allow-All" {
    name = var.security_group_name
    description = "allow all ports"

    ingress {
    # TLS (change to whatever ports you need)
    from_port   = 0
    to_port     = 0
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