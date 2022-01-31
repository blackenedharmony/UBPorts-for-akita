echo "Fixing RIL..."
sleep 2
sudo su
mount -o rw,remount /
mkdir /etc/ofono/ril_subscription.d/
wget https://raw.githubusercontent.com/blackenedharmony/UBPorts-for-akita/main/dual.conf
cp dual.conf /etc/ofono/ril_subscription.d/dual.conf
rm dual.conf
echo "Fixing GUI..."
sleep 2
cat /var/lib/lxc/android/rootfs/ueventd*.rc /vendor/ueventd*.rc | grep ^/dev | sed -e 's/^\/dev\///' | awk '{printf "ACTION==\"add\", KERNEL==\"%s\", OWNER=\"%s\", GROUP=\"%s\", MODE=\"%s\"\n",$1,$3,$4,$2}' | sed -e 's/\r//' >/etc/udev/rules.d/70-GM9PRO.rules
