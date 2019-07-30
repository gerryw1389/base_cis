#!/bin/bash

# 6.1.10 - Ensure no world writable files exist (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 6.1.10 - Ensure no world writable files exist (Scored)" >> /var/log/cis_logs.log

df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 || exit $?

# find / \( -fstype nfs -o -fstype cachefs -o -fstype autofs \
# -o -fstype ctfs -o -fstype mntfs -o -fstype objfs \
# -o -fstype proc \) -prune -o -type f -perm -0002 -print

