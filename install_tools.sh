#!/bin/bash

# Function to check if a command exists
check_installed() {
  if command -v $1 &> /dev/null
  then
    echo "$1 is already installed. Version: $($1 --version)"
  else
    echo "$1 is not installed. Installing..."
    $2
  fi
}

# Install Go
install_go() {
  wget https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
  source ~/.bashrc
  rm go1.21.4.linux-amd64.tar.gz
}

# Install Docker
install_docker() {
  sudo apt update
  sudo apt install -y ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo usermod -aG docker $USER
}

# Install Faas-CLI
install_faascli() {
  curl -sL https://cli.openfaas.com | sudo sh
}

# Install K9s
install_k9s() {
  wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
  tar -xvzf k9s_Linux_amd64.tar.gz
  sudo mv k9s /usr/local/bin/
  rm k9s_Linux_amd64.tar.gz
}

# Install Helm
install_helm() {
  curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
  sudo apt-get install apt-transport-https --yes
  echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
  sudo apt-get update
  sudo apt-get install helm
}

# Check if all tools are installed
echo "Checking and Installing Required Tools..."

check_installed "go" install_go
check_installed "docker" install_docker
check_installed "faas-cli" install_faascli
check_installed "k9s" install_k9s
check_installed "helm" install_helm

echo "Installation complete."

# Verify Installation
echo "Verifying installations..."

for tool in go docker faas-cli k9s helm; do
  if command -v $tool &> /dev/null
  then
    echo "$tool is successfully installed."
  else
    echo "$tool installation failed."
  fi
done

