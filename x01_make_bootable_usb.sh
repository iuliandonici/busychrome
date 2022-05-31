#/bin/bash
# Purpose: make latest MX Linux a bootable USB
# and install a different BIOS

# - Download MX using a shortcut domain like 2bn.ro
curl -L0 2bn.ro/mxiso --output mx.iso
# - Then, put the ISO to the first /dev/sda that you got,
# your 1st USB, basically.
dd if=mx.iso bs=4M of=/dev/sda oflag=sync status=progress

# Get the required file for SEABios
 cd; curl -LO https://github.com/iuliandonici/busychrome/blob/master/firmware-util.sh && sudo bash firmware-util.sh
