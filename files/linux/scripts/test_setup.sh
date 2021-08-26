#!/bin/bash

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi
DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running test: 0.0.0.0 One time startup script" >> /var/log/cis_logs.log

if [[ ! -e /var/log/cis_logs_initialscript.log ]]; then
    exit 1
fi