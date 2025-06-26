variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0b09627181c8d5778" # change to your preferred region's AMI
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "prokey"
  type        = string
}

