#!/bin/bash

# 1.4.2 - Ensure bootloader password is set (Scored)

if [[ ! -e /var/log/cis_logs.log ]]; then
    touch /var/log/cis_logs.log
fi

DATE=`date +"%Y-%m-%d %T"`
echo "$DATE : running fix: 1.4.2 - Ensure bootloader password is set (Scored)" >> /var/log/cis_logs.log

# Remediation:
# Create an encrypted password with grub2-setpassword :
# # grub2-setpassword
# Enter password: <password>
# Confirm password: <password>
# 
# #!/usr/bin/expect
# spawn passwd foo
# expect "password:"
# send "Xcv15kl\r"
# expect "Retype new password:"
# send "Xcv15kl\r"
# interact
# 
# $ cat ~/pfile
# my p@55phras3
# my p@55phras3
# $ cat ~/pfile | grub2-mkpasswd-pbkdf2

# cat burg2 > burg2-mkpasswd-pbkdf2 -0
# 
# pw=$(openssl rand -base64 32)
# useradd grub2superuseraccount
# # Notice proper quoting
# echo "$pw" | passwd grub2superuseraccount --stdin
# # Collect output into a variable
# grubpw=$(printf '%s\n' "$pw" "$pw" | grub2-mkpasswd-pbkdf2)
# # Use the variable in sed -i
# sed -i "/password_pbkdf2/a password_pbkdf2 $grubpw" conffile