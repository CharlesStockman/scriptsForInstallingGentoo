
# Add a key/value pair to the make.conf to signal  booting is done through UEFI
make_conf_file="/etc/portage/make.conf"
echo                                 >> $make_conf_file
echo "# Defining  using UEFI Grub"   >> $make_conf_file
echo 'GRUB_PLAATFORMS="efi-64" '   >> $make_conf_file

emerge sys-boot/grub

# Install Grub
grub-install nuvme0n1 --efi-directory=/boot

# Configure Grub
grub-mkconfig -o /boot/grub/grub.cfg
