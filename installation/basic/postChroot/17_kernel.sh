# Install the kernel

# Build the kernel with Gentoo Patches
emerge sys-kernel/installkernel-gentoo

# Reclaim disk space by removing stale spacee
emerge --depclean

# Install Kernel Sources
emerge sys-kernel/gentoo-sources

# create the symbolic link to the kernel
eselect kernel set 1





