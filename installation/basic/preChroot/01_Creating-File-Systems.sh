#!/bin/sh

# Creates the files format and assumes:
#     partition 1 is the UEFI boot,
#     partition 2 is the swap
#     partition 3 contains the OS 
#
# -F -- Force

drive=/dev/nvme0n1p
partition1=${drive}1
partition2=${drive}2
partition3=${drive}3

mkfs.vfat -F 32 $partition1 
fatlabel $partition1 "BOOT"

mkswap $partition2 
swaplabel $partition3 "SWAP"

mkfs.ext4 -F $partition3 
e2label $partition3 "Gentoo"
