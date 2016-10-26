#!/bin/bash
sudo echo nameserver $1 >> /etc/resolv.conf
sudo rpm -Uvh $2
sudo yum install $3 -y

sudo systemctl enable $3
sudo systemctl start $3