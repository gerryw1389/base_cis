#!/bin/bash

# 5.3.4 - Ensure password hashing algorithm is SHA-512 (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.3.4 - Ensure password hashing algorithm is SHA-512 (Scored)" >> /var/log/cis_logs.log

egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth | grep sha512 || exit $?

egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth | grep sha512 || exit $?