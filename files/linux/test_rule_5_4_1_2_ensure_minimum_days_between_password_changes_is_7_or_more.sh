#!/bin/bash

# 5.4.1.2 - Ensure minimum days between password changes is 7 or more (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.4.1.2 - Ensure minimum days between password changes is 7 or more (Scored)" >> /var/log/cis_logs.log

PMD=$(grep -E "^PASS_MIN_DAYS" /etc/login.defs | awk {'print $2'})

if [[ $PMD -eq '' || $PMD -lt 7 ]]; then
        echo PASS_MIN_DAYS = $PMD
        exit 1
fi

for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
        UPA=$(chage --list $i | grep "Minimum number of days between password change" | cut -d: -f2)
        if [[ $UPA -lt 7 ]]; then
                echo $i days between password change = $UPA
                exit 1
        fi
done