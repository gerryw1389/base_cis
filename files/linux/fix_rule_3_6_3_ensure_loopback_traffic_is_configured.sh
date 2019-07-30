#!/bin/bash

# 3.6.3 - Ensure loopback traffic is configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 3.6.3 - Ensure loopback traffic is configured (Scored)" >> /var/log/cis_logs.log

# Ensure loopback traffic is configured
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -j DROP

# rpm -q iptables
# yum install iptables