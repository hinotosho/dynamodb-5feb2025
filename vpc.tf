# These blocks are for filtering existing VPC and Public Subnet

data "aws_vpc" "existing_daisy_vpc" {
 filter {
   name   = "tag:Name"
   values = ["daisy-vpc-vpc"]
 }
}

data "aws_subnet" "existing_daisy_pub_subnet" {
 filter {
   name   = "tag:Name"
   values = ["daisy-vpc-subnet-public1-us-east-1a"]
 }
}
