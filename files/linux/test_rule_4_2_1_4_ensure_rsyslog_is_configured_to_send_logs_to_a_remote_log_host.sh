#!/bin/bash

# 4.2.1.4 - Ensure rsyslog is configured to send logs to a remote log host (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 4.2.1.4 - Ensure rsyslog is configured to send logs to a remote log host (Scored)" >> /var/log/cis_logs.log

grep -q "^\*.\*[^I][^I]*@" /etc/rsyslog.conf 2>/dev/null || exit 1