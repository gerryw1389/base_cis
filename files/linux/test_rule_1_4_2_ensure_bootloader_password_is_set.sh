#!/bin/bash

# 1.4.2 - Ensure bootloader password is set (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 1.4.2 - Ensure bootloader password is set (Scored)" >> /var/log/cis_logs.log

grep "^GRUB2_PASSWORD" /boot/grub2/grub.cfg || exit $?

# if grep -q "^GRUB2_PASSWORD" /boot/grub2/grub.cfg ; then
#     exit 0
# else
#     exit 1
# fi