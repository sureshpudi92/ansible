variable "ami_id" {
    type = string
    default = "ami-0b4f379183e5706b9"  #default ami
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "security_group_name" {
    type = string
    default = "Allow-All"
}
variable "securityg_group_cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}
variable "tags"{
    type = map
    default={
        Name= "mangoDB"
        Environment= "DEV"
        Project= "RoboShop"
        Component= "mongoDB"
        Terraform= "true"
    }

}

variable "instance_name"{
        type=string
        default= "mangoDB1"
    }
variable "instance_names"{
    type = list
    default = ["mangoDB", "cart", "shipping", "mysql", "payment"]
  
}
variable "zone_id"{
    default = "Z021110927W3KBK83XG0J"

}
variable "public_key" {
    default = "devopsqa.pub"
  
}
  variable "isPROD" {
    default = true
    
  }
