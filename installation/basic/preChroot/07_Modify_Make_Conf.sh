destination_file="/mnt/gentoo/etc/portage/make.conf"

sed -i "s/-O2/-march=native -O2/g" $destination_file

# Add the MAKE_OPTS LINE
echo >>  $destination_file
echo "# How many parallel compilations should happen when installling a package" >> $destination_file
echo "MAKE_OPTS=\"J7\"" >> $destination_file

# Automatically select a mirror
echo  >> $destination_file
echo -n "#Mirrors used to get software" >> $destination_file
mirrorselect -s3 -b10 -o >> $destination_file 

# Which licenses to accept
echo >> $destination_file
echo "#Which licenses to accept" >> $destination_file
echo "ACCEPT_LICENSE=\"-* @FREE @BINARY-REDISTRIBUTABLE\" " >> $destination_file

