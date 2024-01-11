#
# Sets the timezone
#

# Select the timezone from /usr/share/timezone
echo  "US/Eastern" >  /etc/timezone

# Emerge the sys-libs/timezone-data to configure /etc/localtime
# 
# --config -- runs packages specific actions after emgerge process has been completed
#
emerge --config sys-libs/timezone-data


