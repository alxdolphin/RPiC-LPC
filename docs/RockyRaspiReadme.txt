
Rocky 8 Raspberry Pi Images

They have been tested on Raspberry Pi 3 and 4.

Rocky Linux WILL NOT WORK on a Raspberry Pi 1 or 2.  They are 32-bit only, and Rocky Linux only supports arm64 (aarch64).

(edit: Raspberry Pi 2 version 1.2 boards are in fact 64-bit.  There aren't too many of these, but they might work.  Tell us if you have one!)


QUICK START:
####################################################
Download the latest image, and write it to your raw microSD memory card (or other boot device).

GUI WAY (Linux/Win/Mac)
  Grab a program like Balena Etcher ( https://www.balena.io/etcher/ ) GUI-based disk writer.
  Insert your SD card and follow the instructions.  It will extract and write your disk image.


COMMAND LINE WAY (assumes Linux system on a root (sudo su) shell):
  xzcat Rocky_Image_file.raw.xz > /dev/sdX
  (where X is the letter of your usb or memory card device, you can use fdisk -l to find which one)

  BE CAREFUL, be sure which device you are writing to before you do it!  Don't accidentally blow away your laptop/desktop hard drive!



Once your storage device is written to, you should be able to plug it in to a Raspberry Pi and boot!


Default username:  rocky
Default password:  rockylinux


Run "sudo rootfs-expand" to grow the partition and use all of your memory card or hard drive.




TECHNICAL DETAILS ABOUT THE IMAGES:
###################################################
  - Minimal/base install, with some quality of life packages like vim,nano,bash-completion
  - Additional Raspberry Pi repo and release package that has Rpi kernels/firmware from the excellent raspberrypi2 repo from upstream CentOS
  - Script/fix for the wifi on rpi4 (linux-firmware bug)
  - Default user "rocky" (member of wheel, can use sudo).  Root password disabled by default
  - Partition layout: 300 MB /boot , 512 MB swap, ~2800 MB rootfs. Able to fit on a 4 GB or larger sd card
  - Everything else should be more or less a standard Rocky aarch64 installation




Thanks for your interest on Rocky-on-Rpi, feel free to share your experience or contribute in our chat channel at:  https://chat.rockylinux.org/rocky-linux/channels/altarch  !

-The Rocky Linux Team

Thanks for your interest in Rocky Linux on the Raspberry Pi!
