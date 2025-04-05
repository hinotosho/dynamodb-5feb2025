  variable "env" {
  description = "The environment of the AWS infrastructure"
  type        = string
  default     = "dev"
  }
  #More for letting other team member know which environment this code is running in, not essential to have.

  variable "vpc_name" {
  description = "The VPC Name to use"
  type        = string
  default     = "daisy-vpc-vpc"
  }

  variable "subnet_name" {
  description = "The Subnet Name to use"
  type        = string
  default     = "daisy-vpc-subnet-public1-us-east-1a"
  }
