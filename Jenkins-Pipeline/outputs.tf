output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins server."
  value       = module.compute.public_ip
}

output "jenkins_url" {
  description = "URL to access the Jenkins UI."
  value       = "http://${module.compute.public_ip}:8080"
}

output "ssh_command" {
  description = "Command to SSH into the Jenkins server."
  value       = "ssh -i ~/.ssh/your-key-file.pem ubuntu@${module.compute.public_ip}"
}
