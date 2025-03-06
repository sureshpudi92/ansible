resource "aws_key_pair" "deployer" {
  key_name   = "devopsqa.pub"
  public_key = local.key_public
}


resource "aws_instance" "my-server" {
    ami = local.ami_id # devops-practice
    instance_type = local.instanceType
  
}

## locals are type of variable which can have store key value and also have some extra capabilities i.e it can run functions and expressions
# and stores values 