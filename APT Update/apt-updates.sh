#!/usr/bin/env bash
# Author:       Waderni Lotfi
# Description:  apt updates info

#
ZBX_HOSTNAME_PRESENT=$(egrep ^HostnameItem /etc/zabbix/zabbix_agentd.conf -c)
#echo $ZBX_HOSTNAME_PRESENT
if [ "$ZBX_HOSTNAME_PRESENT" -ge "1" ]; then
        #ZBX_HOSTNAME=$(egrep ^Hostname /etc/zabbix/zabbix_agentd.conf | cut -d = -f 2)
        ZBX_HOSTNAME=$(hostname)
else
        #ZBX_HOSTNAME=$(hostname)
        ZBX_HOSTNAME=$(egrep ^Hostname /etc/zabbix/zabbix_agentd.conf | cut -d = -f 2)
fi
#echo $ZBX_HOSTNAME;


UPDATES=$(/usr/lib/update-notifier/apt-check 2>&1||echo "-1,-1")
echo -n '"'$ZBX_HOSTNAME'"' 'apt.security '
echo $UPDATES|cut -d';' -f2
echo -n '"'$ZBX_HOSTNAME'"' 'apt.updates '
echo $UPDATES|cut -d';' -f1
echo -n '"'$ZBX_HOSTNAME'"' 'OS.release '
lsb_release -a 2>/dev/null|grep Release|awk '{print $2}'
