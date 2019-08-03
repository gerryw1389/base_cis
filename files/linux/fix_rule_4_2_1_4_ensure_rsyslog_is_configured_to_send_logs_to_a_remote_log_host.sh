#!/bin/bash

# 4.2.1.4 - Ensure rsyslog is configured to send logs to a remote log host (Scored)


if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 4.2.1.4 - Ensure rsyslog is configured to send logs to a remote log host (Scored)" >> /var/log/cis_logs.log

# Edit the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and add the following line (where loghost.example.com is the name of your central log host).
# *.* @@loghost.example.com
# 
# Run the following command to reload the rsyslogd configuration:
# # pkill -HUP rsyslogd