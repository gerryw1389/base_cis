#!/bin/bash

# 5.3.1 "Ensure password creation requirements are configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.3.1 Ensure password creation requirements are configured (Scored)" >> /var/log/cis_logs.log

grep pam_cracklib.so /etc/pam.d/password-auth | grep -E "try_first_pass\s*retry=3\s*minlen=14" || exit $1

grep pam_cracklib.so /etc/pam.d/system-auth | grep -E "try_first_pass\s*retry=3\s*minlen=14" || exit $1