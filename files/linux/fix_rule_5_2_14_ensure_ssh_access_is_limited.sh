#!/bin/bash

# 5.2.14 - Ensure SSH access is limited (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 5.2.14 - Ensure SSH access is limited (Scored)" >> /var/log/cis_logs.log

# Edit the /etc/ssh/sshd_config file to set one or more of the parameter as follows:
# AllowUsers <userlist>
# AllowGroups <grouplist>
# DenyUsers <userlist>
# DenyGroups <grouplist>