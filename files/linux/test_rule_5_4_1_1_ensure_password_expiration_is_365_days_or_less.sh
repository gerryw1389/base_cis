#!/bin/bash

# 5.4.1.1 - Ensure password expiration is 365 days or less (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.4.1.1 - Ensure password expiration is 365 days or less (Scored)" >> /var/log/cis_logs.log

PMD=$(grep -E "^PASS_MAX_DAYS" /etc/login.defs | awk {'print $2'})

if [[ $PMD -eq '' || $PMD -gt 365 ]]; then
        echo PASS_MAX_DAYS = $PMD
        exit 1
fi

for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
        UPA=$(chage --list $i | grep "Maximum number of days between password change" | cut -d: -f2)
        if [[ $UPA -gt 365 ]]; then
                echo $i maximum days between password change = $UPA
                exit 1
        fi
done