# Introduction
The purpose of this document is to explain how Gentoo was installed on my computer.  This document is not for the beginner, nor will it ever be.

| Task                               | Information                                                                                                                                                                         |
|------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Retrieve Minimal Installation CD   | https://repo-default.voidlinux.org/live/current/void-live-x86_64-20221001-base.iso <br/> Burn the ISO Disk.                                                                         |
| Disk Configuration                 | UEFI will be used <br/> Partition : Type - EFI System <br/> Partition : Type - Swap <br/> Partition : Type - Linux Filesystem <br/><br/> All partitions should be on the same disk. |
| Filesystem                         | ext4                                                                                                                                                                                |
| kernel                             | Standard kernel provided by distribution                                                                                                                                            
| Timezone                           | America/New_York                                                                                                                                                                    |
| Time                               | Set using the hardware clock -- UTC                                                                                                                                                 |
| locale                             | The locale will be en_US                                                                                                                                                            |
| Networking                         | Use Ethernet                                                                                                                                      |
| Init Systems                       | Runit                                                                                                                                                                               |0
| Boot System                        | Grub                                                                                                                                                                                |

## Tips for a Successful Install

| Section | Description                                                                                               | Link                                       |
|---------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------|
| Basic   | Installs a basic linux system including kernel, boot loader, Terminal and timezone/language configuration | [ Basic Installation ](installation/basic) |

# Jira Issues