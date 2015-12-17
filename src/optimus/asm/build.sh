#!/bin/bash
nasm -f bin -o base.bin base.asm
dd if=/dev/zero of=boot.img count=2048
mke2fs boot.img	

sudo umount /mnt
sudo losetup -d /dev/loop0

sudo losetup -f boot.img
sudo mount /dev/loop0 /mnt

sudo mkdir -p /mnt/boot/
sudo cp ./base.bin	/mnt/boot

sudo genisoimage -b boot/base.bin -no-emul-boot -boot-info-table -boot-load-size 4 -input-charset utf8 -o base.iso /mnt

