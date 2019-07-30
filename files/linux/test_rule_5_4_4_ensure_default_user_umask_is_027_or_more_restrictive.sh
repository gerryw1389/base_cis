#!/bin/bash

# 5.4.4 - Ensure default user umask is 027 or more restrictive (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.4.4 - Ensure default user umask is 027 or more restrictive (Scored)" >> /var/log/cis_logs.log

[[ "$(umask)" =~ [0-7][2-7]7$ ]] || exit;