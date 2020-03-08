#!/bin/sh
#install
curl -o /root/amazon-cloudwatch-agent.deb https://s3.amazonaws.com/amazoncloudwatch-agent/debian/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i -E /root/amazon-cloudwatch-agent.deb
#Configure CWAgent
mkdir -p /usr/share/collectd/
touch /usr/share/collectd/types.db