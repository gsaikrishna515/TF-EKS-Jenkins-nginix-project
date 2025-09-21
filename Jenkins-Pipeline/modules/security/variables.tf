variable "project_name" {
  description = "Name for the project to be used in tags."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "my_ip" {
  description = "Your local public IP address for SSH access."
  type        = list(string)
}
