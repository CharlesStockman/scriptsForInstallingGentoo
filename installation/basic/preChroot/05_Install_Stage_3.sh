

#
# Retrieve the current file name of the Stage 3 build with openrc 
#
#filename=`curl -s http://www.gtlib.gatech.edu/pub/gentoo/releases/amd64/autobuilds/latest-stage3-amd64-nomultilib-openrc.txt | grep "openrc" | cut -f2 -d'/' | cut -f1 -d' ' | sed -E 's/\-nomultilib//g'`
#echo $filename

#
# Create the String to get the correct stage 3 build
#
#url="http://www.gtlib.gatech.edu/pub/gentoo/releases/amd64/autobuilds/current-stage3-amd64-nomultilib-openrc/${filename}"
#echo $url

#
# Download Stage 3
#
#curl $url --output /mnt/gentoo/stage3.xz

cp /mnt/transfer/stage3* /mnt/gentoo/stage3.xz

#
# Unpack the stage tarball
#    -p                           preserve permissions
#    --xattrs=include='*.*'       include preservation of the extended attributes in all namespace stored in the archive
#    --numeric_owner              ensure that the user and group ids of the files being extracted from the tarball will remain the same as Gentoo
#
( cd /mnt/gentoo ; tar xpvf stage3.xz --xattrs-include='*.*' --numeric-owner ; rm *.xz )
