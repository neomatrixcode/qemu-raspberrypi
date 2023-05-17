REM curl https://qemu.weilnetz.de/w32/2022/qemu-w32-setup-20221230.exe --output qemu-w32-setup-20221230.exe
REM curl https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/native-emulation/5.4.51%20kernels/kernel8.img --output kernel8.img
REM curl https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/native-emulation/dtbs/bcm2710-rpi-3-b-plus.dtb --output bcm2710-rpi-3-b-plus.dtb
REM curl -LO https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64-lite.img.xz --output 2023-05-03-raspios-bullseye-arm64-lite.img.xz


"C:\Program Files (x86)\qemu\qemu-img.exe" ^
 resize ^
-f raw "2023-05-03-raspios-bullseye-arm64-lite.img" 2G

"C:\Program Files (x86)\qemu\qemu-system-aarch64.exe" ^
-M raspi3b ^
-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" ^
-dtb bcm2710-rpi-3-b-plus.dtb ^
-hda 2023-05-03-raspios-bullseye-arm64-lite.img ^
-kernel kernel8.img ^
-m 1G ^
-serial stdio ^
-usb ^
-device usb-mouse ^
-device usb-kbd ^
-cpu max ^
-net nic ^
-net user,hostfwd=tcp::5022-:22