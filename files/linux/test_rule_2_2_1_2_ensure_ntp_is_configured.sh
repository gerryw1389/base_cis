#!/bin/bash

# 2.2.1.2 - Ensure ntp is configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 2.2.1.2 - Ensure ntp is configured (Scored)" >> /var/log/cis_logs.log

rpm -q ntp | grep -E "^ntp-"
if [[ $? -eq 0 ]]; then

  grep "^restrict -6 default kod nomodify notrap nopeer noquery" /etc/ntp.conf || exit $1

  grep -E "^(server|pool)" /etc/ntp.conf || exit $1
fi