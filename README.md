# Introduction
The purpose of this document is to explain how Gentoo was installed on my computer.  This document is not for the beginner, nor will it ever be.

| Task                             | Information                                                                                                                                                                         |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Retrieve Minimal Installation CD | http://www.gtlib.gatech.edu/pub/gentoo/releases/amd64/<br/>autobuilds/<timestamp>/ <br/> filename: install-amd64-minimal-<release>.iso. <br/> Burn the ISO Disk.                    |
| Disk Configuration               | UEFI will be used <br/> Partition : Type - EFI System <br/> Partition : Type - Swap <br/> Partition : Type - Linux Filesystem <br/><br/> All partitions should be on the same disk. |
| Filesystem                       | ext4                                                                                                                                                                                |
| kernel                           | Gentoo Kernel                                                                                                                                                                       |
| Timezone                         | America/New_York                                                                                                                                                                    |
| Time                             | Set using the hardware clock                                                                                                                                                        |
| locale                           | The locale will be en_US                                                                                                                                                            |
| Networking                       | Use Ethernet since wireless will be installed                                                                                                                                       |
| Environment                      | The developer is root git is present<br>                                                                                                                                   |
| Init Systems                     | OpenRC                                                                                            
| Boot System                      | Grub                                                                                                                                                                                |

## Tips for a Successful Install

| Suggestion                            | Description                                                                                                                                                                             |
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Connect to internet using an ethernet | If you don't know manually how to setup wireless then just use an ethernet connection.                                                                                                  |
| Select a Profile                      | There are many USE Flags and it can be overwhelming to select correctly the first time. Select a profile which will provide a list of Use Flags and can modify the list at a later time. |
| Kernel                                | Use Distribution Kernel since it is the least involved process.  A new kernel can be compiled once you have a stable system.                                                                                                                       | Genkernel configure                                                                                                                                                                       |

| Section | Description                                                                                               | Link                                       |
|---------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------|
| Basic   | Installs a basic linux system including kernel, boot loader, Terminal and timezone/language configuration | [ Basic Installation ](installation/basic) |

The original directions are found in the Gentoo Handbook at: 
[Gentoo Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Media)

## Booting the Live Distribution
Create the Live Distribution by creating a bootable USB by the getting the *.iso from 
the directory https://mirror.leaseweb.com/gentoo/releases/amd64/autobuilds/current-install-amd64-minimal/

<b>Action</b> -- Start the computer with the USB Stick or DVD<br>
<b>Result<b> -- The result will a computer that has a console where the current user is 
root

### Create the Mount Point

To a USB add directory with the scripts for installing Gentoo and a starge3 file ( See Work Around)

Script to create the Gentoo the installation transferred using USB.

| Task                                 | Description                                          |
|--------------------------------------|------------------------------------------------------|
| mkdir /mnt/transfer                  | Creates a mount point                                |
| mount /dev/sdb1 /mnt/transfer        | Starts the root of the filesystem at the mount point |
| copy the files to the home directory | Moving files to the local disk.                      |

<b>Action</b>ls /mnt/transfer
<b>Result</b>>The directory with the scripts to install gentoo and a stage3 compress file should be present

## Jira Issues

<ol>
    <li>Research which filesystem ( ext4, btfs, jfs... ) will provide more value than ext4 </li>
    <li>04_Install_Stage_3.sh is not able to download the stage3 compessed file which is a bug</i>
    <li>05_Modify_Make_Conf.sh 
    <li>Understand the differences between GCC and CLANG.  Which is the best for the Linux Distribution </li>
    <li>Calculate the number of compilations min ( # of threads , memory / 2 -- for the -J number of threads </li>
    <li>For kernel building lookat the Hybrid and Full Manual approach</li>
    <li>Dynamically create an fstab</li>
    <li>For <*> the output decribe the rules for the correct passwd it consuing so get rid of it.</li>
    <li>Select a Looger : Select sysklogd, syslog-ng, metalog</li>
    <li>Which cron to use cronie, dcron, fcron,bcron</li>
    <li>You might get a warning stating that the /etc/localtime can be changed to a 
symlink.  After debugging, I was unable to write the instructions to the
script.  For now follow the instructions in the warning</li>
</ol>
