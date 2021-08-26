#!/bin/bash

# 5.4.1.2 - Ensure minimum days between password changes is 7 or more (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 5.4.1.2 - Ensure minimum days between password changes is 7 or more (Scored)" >> /var/log/cis_logs.log

egrep -q "^(\s*)PASS_MIN_DAYS\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_MIN_DAYS\s+\S+(\s*#.*)?\s*$/\PASS_MIN_DAYS 7\2/" /etc/login.defs || echo "PASS_MIN_DAYS 7" >> /etc/login.defs
  getent passwd | cut -f1 -d ":" | xargs -n1 chage --mindays 7