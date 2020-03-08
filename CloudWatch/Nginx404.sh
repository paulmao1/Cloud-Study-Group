#!/bin/sh
#Install Ngix
apt install nginx -y
systemctl enable nginx
systemctl start nginx
#Send Packets
for i in {1..1000}
do
  curl http://127.0.0.1/$i
  sleep 10
done
