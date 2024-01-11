# Introduction
The purpose of the first section
is to allow the user to boot in a terminal which includes configuring and formatting the drive, configuring the 
make.config, date, locale and installing the kernel, boot loader and basic software including a shell.
                                                                                                                                                            | 
# Instructions

## PreChroot

### Verify the Network is Functioning

The ping has always worked for me, so I assuming it works when any computer has a wired connection..

<b>Action</b> -- ping -c 2 -q gentoo.org<br>
<b>Result</b> -- Two packages should have been transferred.

### Preparing the Disks

#### Create the Filesystems and Adding the labels

This section will assume that the partitions have been created and the disk will be configured with correct label and filesystem them formatted.

<b>Action</b> -- Execute the script 01-Creating-File=Systems.sh<br>
<b>Result</b> -- Verify the drive are correct using "lsblk -f"

<b>The Swap Label is not being attached to the partition, but has not affected the installation and is a minor prbolem.</b>

### Activating swap on

<b>Action</b> -- Execute the script 02_Activate-Swap-Partition.sh<br>
<b>Result</b> -- "swapon --summary" and verify there is an entry

### Mounting the Root Partition

<b>Action</b> -- Execute the script 02_Mounting-File-System.sh<br>
<b>Result</b> -- df -h /mnt/gentoo and verify /mnt/gentoo exist

### Setting the Date / Time

By running the script 03_Setting-the-Data.sh the hardware clock and system time will be synchronized.

<b>Action</b> -- Execute the script 03_Setting-the-Date.sh<br>
<b>Result</b> -- Verify by getting the current time ( UTC Timezone ) from the web

### Downloading and installing a Stage 3 Tarball

| Consideration         | Reasons                                                                             |
|-----------------------|-------------------------------------------------------------------------------------|
| Using No Multilib     | Steam seem to work very will with flatpaks.  Tried when installing Funtoo.  Also I want sytem where the infrstrcuture is simplifed and I a lot of appications and developer libraries           |
| Using OpenRC          | Unix philosophy.                                                                    |
| Using GCC             | I went with GCC since first installation and I do not know mush about clang         |
| Using default profile | This is a learning process so I have decided to skip the hardened, desktop profiles |

<b>Action</b> -- Execute the script 04_Install_Stage_3.sh<br>
<b>Result</b> -- Verify that /mnt/gentoo has the normal unix directories 

### Configuring Compile Options

[GCC Optimization](https://wiki.gentoo.org/wiki/GCC_optimization)

CFlags   -- Optimization flags for GCC
CXXFlags -- Optimization flags for G++

For the -march use the value "native" selects the target architecture<br>
For the optimizations select -O2 since -03 has caused issues for general use<br>
For MakeOpts --jobs -- How many parallel compilations should happen when installing a package 
    `min ( At least 2 Gigabtyes Per Core or output of nproc  )`

<b>No actions defined for this informational section</b>

### Configuring make.conf and Creating gentoo.conf

In this section the following done 
> * Select number of parallel computations 
> * Find and Configure the best mirros
> * Copy the files needed for getting metadata from the mirrors

GENTOO_MIRRORS -- Where the source and binary builds metadata are retrieved.

<b>Action</b>Execute 05_Modify_Make_Conf.sh <br>
<b>Result</b>Verify that /mnt/gentoo/portage/make.conf has march=native<br>
<b>Action</b>Execute 05_Create_Repos_Conf.sh<br>
<b>Result</b>Verify that /mnt/gentoo/etc/portage/repos.conf/gentoo.conf exist

### Copy DNS Information to /etc

<b>Action</b> Execute 06_Copy_DNS_File.sh
<b>Result</b> No test defined.

### Mounting the necessary filesystems

| Filesystem | Description                                                                                |
|------------|--------------------------------------------------------------------------------------------|
| /proc/     | pseudo filesystem from which the linux kernel exposes information to the environment       |
| /sys/      | pseudo filesystem which was meant to replace /proc and is more structed                    |
| /dev/      | A regular files system partially managed by a Linux device mangager ( example udev )       |
| /run/      | A temporary file system used for the files genernated at run time ( ex. PID files or locks |

<b>Action</b> Execute 07_Mount_FileSystems.sh

## Chroot Operations 

### Entering the New Environment

Root will be changed from the USB to the drive where GENTOO will be installed.  To gain access the install scripts 
follow the instructions in the section : "Create the Mount Point" 

<b>Actual</b>:  execute . ./10_After_Chroot.sh 
<b>Reason</b>: Verify the prompt starts with : (chroot) (livecd)

## Post Chroot

### Mount the Boot Partition

Important when compiling the kernel and installing the bootloader

<b>Actual</b>: Execute 11_Mount_Boot.sh
<b>Reason</b>: Execute df and verify /boot is present

### Update the Gentoo Ebuild Directory

Update the Gentoo Ebuild directory with the metadata about the ebuilds available

<b>Action</b>: Execute 12_Ebuild_Repository.sh<br>
<b>Result</b>: Make sure there was no error messages

### Choosing the right profile and Update the World
 
A profile specifies the USE, CFLAGS and other important variables.  It also locks the system to a certain range of 
package versions.  An example of the profile is the one that I have selected: 

@world set = system set + selected set
system set = packages required for a standard software package to run
select set = installed by the user

The list of profiles can be viewed using : eselect profile list<br>
The list of use variables: root #less /var/db/repos/gentoo/profiles/use.desc

<b>Action</b> Execute 13_Update_world.sh
<b>Result</b> Verify that there are no errors

### Configure for the Timezone

Select a timezone from /usr/share/zoneinfo.  An Example my timezone is US/Eastern

<b>Action</b> Execute 14_Timezone.sh
<b>Result</b> Verify there are no errors

### Configure for the locale

A locale is the the language that the computer will use for the display and the rules to work with :
<ul>
    <li>Sorting the Strings</li>
    <li>Display the date and times using the correct format</li>
</ul>

<b>Action</b> Execute 15_Locale.sh
<b>Result</b> verify that /etc/env.d/02locale has the locale selected

### Configure the kernel

> * Installing the firmware.  The firmware is need for wireless, video chips and more to make the system 
fully functional.  kernel symbols that are built as modules (M) will load their associated firmware files from the 
filesystem when they are loaded by the kernel. It is not necessary to include the device's firmware files into the 
kernel's binary image for symbols loaded as modules.

> * Full Automation Approach: Distribution Kernels
> * * A Distribution Kernel is used to configure, automatically build, and install the Linux kernel, 
      its associated modules, and (optionally, but enabled by default) an initramfs file
> * * Future kernel updates are fully automated since they are handled through the package manager

I have selected Full Automation Approach since it is easiest and one the system is up and running I can have backup 
when I configure my own kernel.

| Command                                                       | Description                                   |
|---------------------------------------------------------------|-----------------------------------------------|
| emerge --depclean                                             | Reclaim disk pages by trimming stale packages |
| emerge --prune sys-kernel/gentoo-kernel sys-kernel/gentoo-bin | clean up old kernel versions                  |

<b>Action</b>: Execute 16_Install_firmware.sh
<b>Action</b>: Execute 17_kernel.sh

### Copy the fstab

To describe how disk partitions, various other block devices, or remote file systems should be mounted into the 
file system.

The script will copy the aleread create fstab to /etc/fstab.

<b>Action</b> execute 18_Create_fstab.h

### Configure the network

DHCP -- Dynamically assigns unique IP addresses for devices on a network

<ol>Steps
    <li>Create a hostname and save to the hostname file </li>
    <li>install and "enable" and "start" the DHCP</li>
    <li>Configure the /etc/hosts</li>
</ol>

<b>Action</b> execute 19_Configure_Network.sh

### Root Password

Change the root password since the root's password is scrambled in the /etc/shadow

<b>Action:</b> execute 19_Change_Root_Password

### Installing System Tools

Wireless will not be installed until I need it.

| Tool                 | Description                                  | emerge                                                      |
|----------------------|----------------------------------------------|-------------------------------------------------------------|
| sysklogd             | Default Logger works out of box              | emerge app-admin/sysklogd                                   |
| cron                 | Based on the original cron with security     | emerge sys-process/cronnie<br> rc-update add cronie default |
| locate               | mlocate is a locate/updatedb implementation. | emerge sys-apps/mlocate                                     |
| time synchronization | Update Time via NTP                          | emerge net-misc/chrony<br>rc-update add chronyd default     |
| File System Tools    | For integrity/creating                       | emerge sys-fs/e2fsprogs                                     | 

ssh is already installed, but the following needs to be completed
<ol>
    <li>Add sshd init script in default run level : rc-update add sshd defautl </li>
</ol>

<b>Action: </b> execute 20_Tools.sh

### Install and Configure Boot Manager

For the Boot Manager Grub will be used since it is the standard

<b>Action</b>Execute 21_boot_loader.sh
<b>Action</b>Execute 21_boot_loader_configure.sh






















    










# Jira Issues

