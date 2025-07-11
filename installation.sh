#Manual installation docker and docker compose on jenkins agent

sudo apt update
sudo apt install -y docker.io curl
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu

 
mkdir -p ~/.docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
 
docker --version
docker compose version || true


#Install kubectl on jenkins agent

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


# Update the package list and install kubelet, kubeadm, and kubectl

echo "Updating package list and installing kubelet, kubeadm, and kubectl..."
sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


#Important installations to create backend jar file

sudo apt install maven
java -version
sudo apt update
sudo apt install openjdk-17-jdk
sudo update-alternatives --config java


#Important installations to create frontend Dist file

sudo apt remove -y nodejs npm

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

sudo npm install -g @angular/cli@17


sudo newgrp docker







