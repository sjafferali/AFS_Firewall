#!/bin/bash
#
# AFS Removal Script
#
# Removal script author: Samir J.
#

if [[ ! -d /etc/firewall ]]
then
  echo [!] Firewall not found!
  exit 1
fi

bak_dir="/etc/firewall_"`date +"%Y-%m-%d-%T"`
/etc/firewall/firewall flush
echo -ne "[*] Removing firewall... "
mv /etc/firewall $bak_dir
mv /etc/init.d/firewall $bak_dir/firewall_init
mv /etc/.firewall $bak_dir
rm -f /usr/sbin/firewall
echo Done

