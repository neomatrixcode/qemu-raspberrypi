
# curl https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/native-emulation/5.4.51%20kernels/kernel.img --output kernel.img
# curl https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/native-emulation/dtbs/bcm2708-rpi-zero-w.dtb --output bcm2708-rpi-zero-w.dtb
# curl -LO https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf/images/raspios_oldstable_lite_armhf-2022-09-26/2022-09-22-raspios-buster-armhf-lite.img.xz --output 2022-09-22-raspios-buster-armhf-lite.img.xz

sudo qemu-system-aarch64 \
-machine raspi0 \
-append "rw console=ttyAMA0,115200 root=/dev/vda2 noresume" \
-dtb bcm2708-rpi-zero-w.dtb \
-hda 2022-09-22-raspios-buster-armhf-lite.img \
-kernel kernel.img \
-cpu max \
-serial stdio \
-net nic \
-net "user,hostfwd=tcp:127.0.0.1:5022-:22"
