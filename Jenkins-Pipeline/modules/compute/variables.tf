
variable "project_name" {
  description = "Name for the project to be used in tags."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the AWS EC2 Key Pair for SSH access."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the instance."
  type        = list(string)
}
