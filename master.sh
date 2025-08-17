#!/bin/bash
sudo docker swarm init --advertise-addr=192.168.56.100
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh

# exemplo: nginx replicado
sudo docker service create --name web --replicas 3 \
  --publish 8080:80 \
  --network minha-rede \
  nginx:latest
