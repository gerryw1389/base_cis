#!/bin/bash

# 4.2.1.3 - Ensure rsyslog default file permissions configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 4.2.1.3 - Ensure rsyslog default file permissions configured (Scored)" >> /var/log/cis_logs.log

echo "\$FileCreateMode 0640">>/etc/rsyslog.conf