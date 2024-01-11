#
# Set the locale ( the language the computer will use )
#
# locale.gen -- generates all locales specified in the /etc/locale.gen file
#
sed s/#en_US/en_US/ -i /etc/locale.gen
locale-gen
eselect locale set 3

# Update the shell
env-update && source /etc/profile && export PS1="(chroot) $PS1"
