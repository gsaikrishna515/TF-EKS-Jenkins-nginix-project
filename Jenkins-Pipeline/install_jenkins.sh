#!/bin/bash
# Using 'set -e' will make the script exit if any command fails, which is good for debugging.
set -e

# --- Update Packages and Install Dependencies ---
# Run an update and install software-properties-common, gnupg for managing repos, and unzip for the AWS CLI.
sudo apt-get update -y
sudo apt-get install -y gnupg software-properties-common unzip

# --- Install Java (Required for Jenkins) ---
# Jenkins requires Java to run. We will install OpenJDK 17.
sudo apt-get install -y openjdk-17-jre

# --- Install Jenkins ---
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

# --- Start and Enable Jenkins Service ---
sudo systemctl start jenkins
sudo systemctl enable jenkins

# ------------------------------------------------------------------
# --- NEW: Install EKS Interaction Tools ---
# ------------------------------------------------------------------

# --- Install Terraform ---
# 1. Add the HashiCorp GPG key.
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 2. Add the official HashiCorp repository.
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 3. Update and install Terraform.
sudo apt-get update -y
sudo apt-get install -y terraform

# --- Install AWS CLI v2 ---
# 1. Download the AWS CLI installer.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# 2. Unzip the installer.
unzip awscliv2.zip

# 3. Run the installation script.
sudo ./aws/install

# 4. Clean up the downloaded files.
rm -rf awscliv2.zip aws

# --- Install kubectl ---
# 1. Download the latest stable kubectl binary.
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# 2. Make the kubectl binary executable.
chmod +x kubectl

# 3. Move the binary into your PATH.
sudo mv kubectl /usr/local/bin/

# --- Grant Jenkins User Docker Permissions (Optional but Recommended) ---
# If you plan to build Docker images in Jenkins, the 'jenkins' user needs permission.
# sudo usermod -aG docker jenkins

# All installations are complete.
echo "Jenkins and all required tools are installed."


