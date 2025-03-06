output "private_ip" {
    value = aws_instance.test[*].private_ip
  }