# Zabbix template for monitoring APT package updates.

Template for monitoring APT Regular packages updates and Security packages updates, Updates are checked using APT UpdateNotifier package; On Ubuntu the package is installed by default but on Debian is not, you need to install the update-notifier-common package. 

# Requirements

1. Make sure to install the zabbix-sender package on the server where would you like to monitor the APT package updates using the following command : # apt-get install zabbix-sender

# Installation

1. Create apt-updates.sh script.
2. Make it excutable using the command : chmod +x apt-updates.sh
3. Create a cron job :
#########################################################################################
  0 1 * * * root /root/apt-updates.sh | zabbix_sender -z IP-ZABBIX-SERVER -i - >/dev/null

4. Import APT-Updates.xml Template to Zabbix Frontend.
5. Link the Server to Servers that you want to monitor APT package updates.
