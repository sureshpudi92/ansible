variable "ami_id" {
    type = string
    default = "ami-0b4f379183e5706b9"
  
}

variable "instances" {

    type = map
    default = {
        mangoDB = "t3.micro"
        mysql = "t3.micro"
        catalogue = "t2.micro"
        redis= "t2.micro"
        web = "t2.micro"
    }
  
}

variable "zone_id"{
    default = "Z021110927W3KBK83XG0J"

}
variable "domain" {

    default = "devopsqa.online"
  
}

variable "security_group_name" {
    type = string
    default = "Allow-All"
}
variable "securityg_group_cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}
variable "ingress" {

    type  = list
    default = [
 {  from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "allow port 80 from public"
    cidr_blocks = ["0.0.0.0/0"]
  
 }, {from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "allow port 22 from public"
    cidr_blocks = ["0.0.0.0/0"]}, 
    {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "allow port 443 from public"
    cidr_blocks = ["0.0.0.0/0"]
    }]

  
}