#!/bin/sh

# Configure CentOS 7 AMI for ELK

set -ex

sudo yum remove docker \
  docker-common \
  docker-selinux \
  docker-engine

sudo yum install -y \
  yum-utils \
  ntp
  # device-mapper-persistent-data \
  # lvm2 \

# sync time
sudo ntpdate pool.ntp.org
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service
sudo systemctl status ntpd.service
sudo ntpq -p

# prevents error:
# [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -n vm.max_map_count

# # make persistant data mount point for elasticsearch
# sudo mkdir /var/lib/elasticsearch

sudo yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

sudo yum makecache fast

sudo yum -y install docker-ce

sudo systemctl start docker
sudo systemctl enable docker
docker --version

# sudo groupadd docker
sudo usermod -aG docker $USER
# must exit to set
