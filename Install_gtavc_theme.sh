#!/bin/bash

ROOT_UID=0

if [ "$UID" -eq "$ROOT_UID" ]; then
  cp -a Gtavc_i /boot/grub/themes/Gtavc_i
  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
  echo "GRUB_THEME=\"/boot/grub/themes/Gtavc_i/theme.txt\"" >> /etc/default/grub
  update-grub
  grub-mkconfig
  echo -e "/n Grub Theme applied Enjoy !!!"
else
  echo -e "/n You have to run this as root. i.e sudo ./install.sh "
fi
