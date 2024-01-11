#/bin/sh

# mounts the partiton for the linux file system

[ -d /mnt/gentoo ] || mkdir --parents /mnt/gentoo

mount /dev/nvme0n1p3 /mnt/gentoo
