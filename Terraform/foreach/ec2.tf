resource "aws_instance" "roboshop" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    tags = {
        name=each.key
    }
  
}

resource "aws_route53_record" "record" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id  # Replace with your hosted zone ID
    name    = "${each.key}.${var.domain}" #interpolation
    type    = "A"
    ttl     = 1
    records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]  # Replace with your IP address

  
}
