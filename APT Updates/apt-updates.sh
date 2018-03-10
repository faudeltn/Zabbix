#!/usr/bin/env bash
# Author:       Waderni Lotfi
# Website       www.yallalabs.com
# Youtube       https://www.youtube.com/c/YallaLabs
# Description:  Apt updates Monitor using zabbix
#
#
ZBX_HOSTNAMEITEM_PRESENT=$(egrep ^HostnameItem /etc/zabbix/zabbix_agentd.conf -c)
#echo $ZBX_HOSTNAMEITEM_PRESENT
if [ "$ZBX_HOSTNAMEITEM_PRESENT" -ge "1" ]; then
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
