#
# Commands to do right after chroot.  When chroot is called the rest of the script can't be executed.
#
source /etc/profile
export PS1="(chroot) ${PS1}"
