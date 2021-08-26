#!/bin/bash

# 3.6.5 - Ensure firewall rules exist for all open ports (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 3.6.5 - Ensure firewall rules exist for all open ports (Scored)" >> /var/log/cis_logs.log

# tcp
for port in $(netstat -lnt |grep ^tcp | grep LISTEN | awk {'print $4'} | cut -d":" -f2); do
       iptables -A INPUT -p tcp --dport $port -m state --state NEW -j ACCEPT
done

# udp
for port in $(netstat -lnt |grep ^udp | grep LISTEN | awk {'print $4'} | cut -d":" -f2); do
       iptables -A INPUT -p udp --dport $port -m state --state NEW -j ACCEPT
done