#!/usr/bin/env bash
hostnamectl set-hostname sunrain990
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -

systemctl enable docker
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://73wjc4fa.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl start docker