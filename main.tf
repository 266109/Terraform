provider "aws"{
region="us-east-1"# < --- here 
}

data "aws_vpc" "existing_vpc" {
  id = "vpc-086a289402f692c10" # Replace with your existing VPC ID
}


data "aws_subnet" "existing_subnet" {
  id = "subnet-08a89211d52d8b7f7" # Replace with your existing Subnet ID
}

data "aws_security_group" "existing_sg" {
  id = "sg-065d6e671aceef7be" 
}

resource "aws_instance" "nsec2" {

ami="ami-0224820b4e90b6949"
instance_type="t2.micro"

vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
subnet_id              = data.aws_subnet.existing_subnet.id

  tags = {
    Name = "NamanInstance"  
  }
}



