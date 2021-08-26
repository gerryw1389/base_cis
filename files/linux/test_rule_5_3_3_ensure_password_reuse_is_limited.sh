#!/bin/bash

# 5.3.3 - Ensure password reuse is limited (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.3.3 - Ensure password reuse is limited (Scored)" >> /var/log/cis_logs.log

R=$(egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth | grep "remember" | sed 's/.*remember=\([0-9]*\).*/\1/g')
if [[ $R -lt 5 ]] ; then
    exit 1
fi

R=$(egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth |grep "remember" | sed 's/.*remember=\([0-9]*\).*/\1/g')
if [[ $R -lt 5 ]] ; then
    exit 1
fi