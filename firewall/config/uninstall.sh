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
/etc/firewall/firewall stop
echo -ne "[*] Removing firewall... "
mv /etc/firewall $bak_dir
rm -f /etc/init.d/firewall
mv /usr/lib/systemd/system/firewall.service $bak_dir
systemctl daemon-reload
mv /etc/.firewall $bak_dir
rm -f /usr/sbin/firewall
echo Done

