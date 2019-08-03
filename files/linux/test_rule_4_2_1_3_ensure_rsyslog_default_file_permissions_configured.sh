#!/bin/bash

# 4.2.1.3 - Ensure rsyslog default file permissions configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 4.2.1.3 - Ensure rsyslog default file permissions configured (Scored)" >> /var/log/cis_logs.log

EC=0
[[ "$(grep ^\$FileCreateMode /etc/rsyslog.conf)" =~ 0[0-6][0-4]0$ ]] || EC=1
if [[ $EC == 0 ]]; then
        exit 0
fi

if [[ $(ls -A /etc/rsyslog.d/) ]] ; then
        [[ "$(grep ^\$FileCreateMode /etc/rsyslog.d/*.conf)" =~ 0[0-6][0-4]0$ ]] || EC=1
        if [[ $EC == 0 ]]; then
                exit 0
        fi
fi