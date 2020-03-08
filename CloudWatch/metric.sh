#!/bin/sh
remote_ip=172.31.1.1
ping_count=5
tc qdisc add dev eth0 root handle 1: htb
tc class add dev eth0 parent 1: classid 1:1 htb rate 100mbit
tc filter add dev eth0 parent 1: protocol ip prio 1 u32 flowid 1:1 match ip dst 172.31.1.1/32
tc qdisc add dev eth0 parent 1:1 handle 10: netem loss 60%
while true;do
  packet_loss=$(ping -c 5 172.31.1.1 | grep 'packet los' | sed -e 's/^.*received,//' -e 's/% packet loss.*//')
  aws cloudwatch put-metric-data --metric-name PacketLoss --namespace NetOps --unit Percent --value "$packet_loss" --dimensions RemoteIp="$remote_ip";
done;
