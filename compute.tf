locals {
 resource_prefix = "daisy-tf"
}

resource "aws_iam_instance_profile" "daisy_instance_profile" {
  name = "${local.resource_prefix}-instance-profile"
  role = aws_iam_role.dynamodb_access_role.name
}

resource "aws_instance" "public" {
 ami                         = "ami-00a929b66ed6e0de6" #Challenge, find the AMI ID of Amazon Linux 2 in us-east-1
 instance_type               = "t2.micro"
 subnet_id                   = data.aws_subnet.existing_daisy_pub_subnet.id
 associate_public_ip_address = true
 key_name                    = "daisy_keypair_two" #Change to your keyname, e.g. jazeel-key-pair
 vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 iam_instance_profile = aws_iam_instance_profile.daisy_instance_profile.name
 tags = {
   Name = "${ local.resource_prefix }-ec2-dynamodb-reader-${ var.env }" # Ensure your
 }
}


output "ec2_public_ip" {
 value = aws_instance.public.public_ip
}
#Prints the EC2 instance public IP address for checking with created resource in AWS console

resource "aws_security_group" "allow_ssh" {
 name        = "${ local.resource_prefix }-security-group-ssh"
 description = "Allow SSH inbound"
 vpc_id      = data.aws_vpc.existing_daisy_vpc.id
}


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
 security_group_id = aws_security_group.allow_ssh.id
 cidr_ipv4         = "0.0.0.0/0" 
 from_port         = 22
 ip_protocol       = "tcp"
 to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 0 #Setting to 0 allows all port ranges
  ip_protocol = "tcp" 
  to_port = 0 #Setting to 0 allows all port ranges
}