# Zabbix template for monitoring APT package updates.

# Installation
1. Copy the apt-updates.sh script to /usr/lib/zabbix/scripts/ directory
2. Make it excutable using the command chmod +x
3. Create a con job :
0 1 * * * root /usr/lib/zabbix/scripts/apt-updates.sh | zabbix_sender -z <IP-ZABBIX-SERVER> -i - >/dev/null
4. Import templates/apt-updates.xml to Zabbix frontend.
