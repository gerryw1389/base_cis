#!/bin/bash

# 1.4.3 - Ensure authentication required for single user mode (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 1.4.3 - Ensure authentication required for single user mode (Scored)" >> /var/log/cis_logs.log

grep /sbin/sulogin /usr/lib/systemd/system/rescue.service | grep -E 'ExecStart=-/bin/sh -c "(/usr)?/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"' || exit $?

grep /sbin/sulogin /usr/lib/systemd/system/emergency.service | grep -E 'ExecStart=-/bin/sh -c "(/usr)?/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"' || exit $?