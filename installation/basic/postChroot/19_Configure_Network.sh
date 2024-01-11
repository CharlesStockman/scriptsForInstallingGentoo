# Name the computer
hostname="starbase_1"
echo  $hostname >  /etc/hosts

# Install and Configure the  DNS
emerge net-misc/dhcpcd
rc-update add dhcpcd default
rc-service dhcpcd start

# Create the hosts file
cat << _end_of_text > /etc/hosts
# This defines the current system and must be set
127.0.0.1 $hostname localhost
_end_of_text

# Activate network interfaces at boot
cd /etc/init.d
ln -s net.lo net.eth0
rc-update add net.eth0 default
