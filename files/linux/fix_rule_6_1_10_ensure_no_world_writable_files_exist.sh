#!/bin/bash

# 6.1.10 - Ensure no world writable files exist (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 6.1.10 - Ensure no world writable files exist (Scored)" >> /var/log/cis_logs.log

# pfexec chmod o-w [filename] 

# output=$(
# df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 -printf "World-Writable file %p\n" 2>/dev/null
# )
# 
# # we captured output of the subshell, let's interpret it
# if [ "$output" != "" ] ; then
#     # print the reason why we are failing
#     echo "$output"
#     exit "${XCCDF_RESULT_FAIL:-102}"
# else
#     exit "${XCCDF_RESULT_PASS:-101}"
# fi