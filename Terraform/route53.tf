resource "aws_instance" "test" {
    count = 5
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "mangoDB" || var.instance_names[count.index] == "mysql" ? "t3.micro" : "t2.micro"
    tags ={
        Name = var.instance_names[count.index]

    } 
  
}
resource "aws_route53_record" "record" {
    count = 5
    zone_id = var.zone_id  # Replace with your hosted zone ID
    name    = "${var.instance_names[count.index]}.devopsqa.online" #interpolation
    type    = "A"
    ttl     = 1
    records = [aws_instance.test[count.index].private_ip]  # Replace with your IP address

  
}


  
