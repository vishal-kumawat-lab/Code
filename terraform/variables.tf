variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_ami" {
 default = "ami-019715e0d74f695be"
}

variable "key_name" {
  description = "EC2 key pair name"
}
variable "name" {
 default = "8byte-app"
}
