#!/bin/sh

# Copy the sytem time to the hardware clock, so the system time persists across reboots.
hwclock --systohc
