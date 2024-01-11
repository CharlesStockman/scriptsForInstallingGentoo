# BasIC tools that are need, but each different has multiple selections

# Select your sysklogd
emerge app-admin/sysklogd

# Select your cron
emerge sys-process/cronie
rc-update add cronie default

# Tools for the locate database
emerge sys-apps/mlocate

# Update time via NTP 
emerge net-misc/chrony
rc-update add chronyd default

# Filesystem tools
emerge sys-fs/e2fsprogs 

# nvme -- Recommended for correct scheduling behavior
emerge sys-block/io-schedular-udev-rules


