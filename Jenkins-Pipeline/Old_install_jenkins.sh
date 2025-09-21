#!/bin/bash
# Using 'set -e' will make the script exit if any command fails
set -e

# Update the package lists for upgrades and new package installations
sudo apt-get update -y

# Jenkins requires Java to run. We will install OpenJDK 17.
sudo apt-get install -y openjdk-17-jre

# Jenkins is not in the default Ubuntu packages. We need to add the Jenkins repository.
# 1. Add the Jenkins GPG key to the system's list of trusted keys.
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  
# 2. Add the Jenkins repository to the system's package sources.
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
# 3. Update the package lists again to include the new Jenkins repository.
sudo apt-get update -y

# 4. Install Jenkins
sudo apt-get install -y jenkins

# Start the Jenkins service
sudo systemctl start jenkins

# Enable the Jenkins service to start on boot
sudo systemctl enable jenkins

