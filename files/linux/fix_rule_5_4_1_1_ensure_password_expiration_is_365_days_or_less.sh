#!/bin/bash

# 5.4.1.1 - Ensure password expiration is 365 days or less (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 5.4.1.1 - Ensure password expiration is 365 days or less (Scored)" >> /var/log/cis_logs.log

egrep -q "^(\s*)PASS_MAX_DAYS\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_MAX_DAYS\s+\S+(\s*#.*)?\s*$/\PASS_MAX_DAYS 90\2/" /etc/login.defs || echo "PASS_MAX_DAYS 90" >> /etc/login.defs
  getent passwd | cut -f1 -d ":" | xargs -n1 chage --maxdays 180