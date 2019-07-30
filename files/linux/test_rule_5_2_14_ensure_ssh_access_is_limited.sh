#!/bin/bash

# 5.2.14 - Ensure SSH access is limited (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.2.14 - Ensure SSH access is limited (Scored)" >> /var/log/cis_logs.log

grep -qE "^AllowUsers|^AllowGroups|^DenyUsers|^DenyGroups" /etc/ssh/sshd_config || exit $?