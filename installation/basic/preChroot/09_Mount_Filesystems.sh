#
# Monnt the files systems need for the new system ( activated by chroot ) to operate corectly
#
# --bind      mount a directory on another direcotry 
# --rbind     does it recursively for bind
#

mount --types proc /proc /mnt/gentoo/proc

mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys

mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev

mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
