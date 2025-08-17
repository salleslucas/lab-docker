#!/bin/bash
set -e  # Para abortar se algum comando falhar

echo "Atualizando pacotes..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Instalando pré-requisitos..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "Adicionando chave GPG do Docker..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Adicionando repositório Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Atualizando pacotes novamente..."
sudo apt-get update -y

echo "Instalando Docker e plugins..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Habilitando e iniciando Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Verificando instalação..."
sudo docker run hello-world

echo "Docker instalado com sucesso!"
