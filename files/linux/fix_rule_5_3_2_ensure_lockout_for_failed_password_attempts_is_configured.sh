#!/bin/bash

# 5.3.2 - Ensure lockout for failed password attempts is configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 5.3.2 - Ensure lockout for failed password attempts is configured (Scored)" >> /var/log/cis_logs.log

echo "auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900" >> /etc/pam.d/system-auth
echo "auth [success=1 default=bad] pam_unix.so" >> /etc/pam.d/system-auth
echo "auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900" >> /etc/pam.d/system-auth
echo "auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900" >> /etc/pam.d/system-auth