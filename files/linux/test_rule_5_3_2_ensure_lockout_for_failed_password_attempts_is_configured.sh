#!/bin/bash

# 5.3.2 - Ensure lockout for failed password attempts is configured (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 5.3.2 - Ensure lockout for failed password attempts is configured (Scored)" >> /var/log/cis_logs.log

cat /etc/pam.d/password-auth | grep -E "auth\s*required\s*pam_faillock.so" || exit $?
cat /etc/pam.d/password-auth | grep -E "auth\s*\[success=1\s*default=bad\]\s*pam_unix.so" || exit $?
cat /etc/pam.d/password-auth | grep -E "auth\s*\[default=die\]\s*pam_faillock.so" ||exit $?
cat /etc/pam.d/password-auth | grep -E "auth\s*sufficient\s*pam_faillock.so" || exit $?

cat /etc/pam.d/system-auth | grep -E "auth\s*required\s*pam_faillock.so" || exit $?
cat /etc/pam.d/system-auth | grep -E "auth\s*\[success=1\s*default=bad\]\s*pam_unix.so" || exit $?
cat /etc/pam.d/system-auth | grep -E "auth\s*\[default=die\]\s*pam_faillock.so" ||exit $?
cat /etc/pam.d/system-auth | grep -E "auth\s*sufficient\s*pam_faillock.so" || exit $?