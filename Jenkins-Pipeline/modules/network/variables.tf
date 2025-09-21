variable "aws_region" {
  description = "The AWS region."
  type        = string
}

variable "project_name" {
  description = "Name for the project to be used in tags."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}
