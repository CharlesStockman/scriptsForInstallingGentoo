#
# Copy dns file to the new version of the GENTOO
#

#
# --dereference -- If resolv.conf is a symbolic linke then the links target is copied instead of the symbolic link itself
#
cp --dereference /etc/resolv.conf /mnt/gentoo/etc 
