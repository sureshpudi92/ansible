locals {
  ami_id="ami-0b4f379183e5706b9"
  key_public = file("${path.module}/devopsqa.pub")
  instanceType=var.isPROD ? "t2.micro" : "t3.micro"
}