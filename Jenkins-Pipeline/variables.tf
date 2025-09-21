variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "A name for the project to tag resources."
  type        = string
  default     = "TF-Jenkins-Project"
}

variable "ssh_key_name" {
  description = "The name of your AWS EC2 Key Pair for SSH access."
  type        = string
}

variable "my_ip" {
  description = "Your local public IP address for SSH access."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the Jenkins server."
  type        = string
  default     = "t2.micro"
}
