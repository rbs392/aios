#!/bin/bash

mkdir -p ./iso/boot/grub
cp ./resources/stage2_eltorito ./iso/boot/grub/

nasm -f elf32 base.s
ld -T link.ld -melf_i386 base.o -o kernel.elf

cp kernel.elf ./iso/boot/
cp menu.lst ./iso/boot/grub/

genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -input-charset utf8 -boot-info-table -o base.iso iso

