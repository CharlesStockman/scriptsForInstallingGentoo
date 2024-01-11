# Introduction
The purpose of this document is to explain how VOID Linux Distribution was installed on my computer.  The purpose of 
the section is to product a functioning system where the user can log into a terminal .  There will be many steps 
including configuring and formatting the drive, setting the date, locale and installing the kernel, boot loader 
and basic software including a shell.

# Instructions 

## Basic Configuration

### Booting the Live Distribution

<b>User Name: </b>root<br>
<b>Password: </b>voidlinux

<b>Action</b> -- Start the computer with the USB Stick and login root <br>
<b>Result<b> -- The result will a computer that has a console where the current user is root

The directions are found in the Void Handbook at: 
[Gentoo Handbook](https://docs.voidlinux.org/installation/guides/chroot.html)

### Create the Mount Point

Script to create the Gentoo the installation transferred using USB.

| Task                                 | Description                                          |
|--------------------------------------|------------------------------------------------------|
| mkdir /mnt/transfer                  | Creates a mount point                                |
| mount /dev/sda1 /mnt/transfer        | Starts the root of the filesystem at the mount point |

### Verify the Network is Functioning 

The ping has always worked for me, so I assuming it works when any computer has a wired connection.

<b>Action</b> -- ping -c 2 -q gentoo.org<br>
<b>Result</b> -- Two packages should have been transferred.

### Preparing the Disks

#### Create the Filesystems and Adding the labels

This section will assume that the partitions have been created and the disk will be configured with correct label and
filesystem then formatted.

<b>Action</b> -- Execute the script 01-Creating-File=Systems.sh<br>
<b>Result</b> -- Verify the drive are correct using "lsblk -f"

### Mounting the Partitions

<b>Action</b> -- Execute the script 02_Mounting-File-System.sh<br>
<b>Result</b> -- df -h to see the new mount points

## Basic Installation

### Install The Software

Install the base_system needed to start working and configuring the 
software installed by the user.

<b>Action: </b>Execute 03_Base_installation.sh

### Chroot 

xchroot

| Capability      | Description                                                                |
|-----------------|----------------------------------------------------------------------------|
| Mount subsystem | mount the /var, /tmp, /usr automatically provided they are listed in fstab |
 | Mount           | mount automatically proc,sysfs, /dev /run                                  | 

<b>Action: </b> execute 04_Chroot.sh

### Configuring the System

<ol>Configuration
<li>Provide the hostname in /etc/hostname</li>
<li>Uncomment the desired locale and run xbps-reconfigure -f glib-locales</li>
<li>Select local from /etc/default/locales</li>
</ol>

Note: If the local is "en_Us" then the second step does not need to be done

<b>Action: </b>Execute 05_Configuration.sh
### Set the root password

<b>Action: <b>Execute 06_Change_Root_Password.sh

### Configure the FSTAB

Based on the instructions from void linux added a tmpfs mount
point.  tmpfs is closely related to a ramdisk, but grow/shrink 
as needed.  tmpfs is used for the tmp directory and for shared 
memory.

<b>Action: </b>Execute 07_Create_fstab.sh 

### Installing Grub

<b>Action: </b>Execute 08_Boot_loader_configuration 

### Finalization 

Finishes the installation.  Note xpbs-reconfigure will call grub-mkconfig installed of the user calling the 
command manually

### Sbhutdown

Umount the new directory of the distro and reboots





