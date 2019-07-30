#!/bin/bash

if [[ ! -e /var/log/cis_logs_initialscript.log ]]; then
    touch /var/log/cis_logs_initialscript.log
fi
DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 0.0.0.0 One time startup script" >> /var/log/cis_logs_initialscript.log


echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue

echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net

egrep -q "^(\s*)Banner\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)Banner\s+\S+(\s*#.*)?\s*$/\1Banner \/etc\/issue.net\2/"

/usr/sbin/grub2-setpassword
