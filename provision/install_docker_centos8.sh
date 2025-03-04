#!/bin/bash
# Install docker in centos

# Remove any old versions
sudo yum remove docker docker-common docker-selinux docker-engine

# Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Configure docker repository
echo "Removing podman and installing Docker CE"
dnf remove -y podman buildah
dnf install -y yum-utils  vim mc bash-completion glibc-all-langpacks git
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io  docker-compose-plugin

# Install Docker-ce
#sudo yum install docker-ce -y

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Post Installation Steps
# Create Docker group
sudo groupadd docker

# Add user to the docker group
sudo usermod -aG docker $USER

echo "Installation Complete -- Logout and Log back"

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Permssion +x execute binary
chmod +x /usr/local/bin/docker-compose

# Create link symbolic 
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check Version docer-compose
echo "Installation Complete -- Logout and Log back"
docker-compose --version

sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
systemctl stop firewalld
systemctl disable firewalld
timedatectl set-timezone "Europe/Madrid"
timedatectl

##un comando para listar y modificar la configuración de localización/mapa del teclado.
localectl
localectl set-locale LANG=es_ES.utf8
localectl set-keymap es
localectl

#Sobrescribir /etc/hosts con las nuevas entradas
cat <<EOL | sudo tee /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.33.10  docker1.curso.local docker1
192.168.33.11  docker2.curso.local docker2
EOL


