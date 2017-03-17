# Cross Linux From Scratch (CLFS) on the Raspberry Pi

Cross Linux From Scratch (CLFS) is a project that provides you with step-by-step instructions for building your own customized Linux system entirely from source.

**Default root password:** `piclfs`

### Preparing Build Environment

Debian 8.6 or Ubuntu 16.04 is recommended.

``` bash
sudo apt update
sudo apt install g++ libncurses5-dev
```

### Build PiCLFS

Use `make list-defconfigs` to display the list of boards, and load with `make <name>_defconfig` command.

``` bash
make <name>_defconfig
make all
```

### Build Toolchain

``` bash
make toolchain
```

```
$ arm-linux-gnueabihf-gcc --version
arm-linux-gnueabihf-gcc (PiCLFS 2017.03) 6.3.0
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

### Build System

``` bash
make system
```

### Build Kernel

``` bash
make kernel
```

### Generate PiCLFS sdcard image

``` bash
make image
```

### Show build settings
``` bash
make settings
```

```
>> Build Settings:
SHELL: bash
CONFIG_HOST: x86_64-cross-linux-gnu
CONFIG_TARGET: arm-linux-gnueabihf
CONFIG_HOSTNAME: piclfs
CONFIG_ROOT_PASSWD: piclfs
CONFIG_LOCAL_TIMEZONE: Asia/Seoul
CONFIG_PKG_VERSION: PiCLFS 2017.03
CONFIG_BUG_URL: https://github.com/LeeKyuHyuk/PiCLFS/issues
CONFIG_PARALLEL_JOBS: 4
WORKSPACE_DIR: /home/leekyuhyuk/piclfs
PACKAGES_DIR: /home/leekyuhyuk/piclfs/packages
SCRIPTS_DIR: /home/leekyuhyuk/piclfs/scripts
OUTPUT_DIR: /home/leekyuhyuk/piclfs/out
BUILD_DIR: /home/leekyuhyuk/piclfs/out/build
TOOLS_DIR: /home/leekyuhyuk/piclfs/out/tools
KERNEL_DIR: /home/leekyuhyuk/piclfs/out/kernel
ROOTFS_DIR: /home/leekyuhyuk/piclfs/out/rootfs
IMAGES_DIR: /home/leekyuhyuk/piclfs/out/images
SYSROOT_DIR: /home/leekyuhyuk/piclfs/out/tools/usr/arm-linux-gnueabihf/sysroot
PATH: "/home/leekyuhyuk/piclfs/out/tools/bin:/home/leekyuhyuk/piclfs/out/tools/sbin:/home/leekyuhyuk/piclfs/out/tools/usr/bin:/home/leekyuhyuk/piclfs/out/tools/usr/sbin:/home/leekyuhyuk/bin:/home/leekyuhyuk/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
EXTRACT: /home/leekyuhyuk/piclfs/scripts/extract.sh
STEP: /home/leekyuhyuk/piclfs/scripts/step.sh
SUCCESS: /home/leekyuhyuk/piclfs/scripts/success.sh
ERROR: /home/leekyuhyuk/piclfs/scripts/error.sh

>> Device Settings:
CONFIG_ABI: aapcs-linux
CONFIG_CPU: cortex-a7
CONFIG_FPU: neon-vfpv4
CONFIG_FLOAT: hard
CONFIG_MODE: arm
CONFIG_LINUX_KERNEL_DEFCONFIG: bcm2709
CONFIG_LINUX_KERNEL_INTREE_DTS_NAME: bcm2709-rpi-2-b
```

### Flash an SD Card

``` bash
make flash
```

### Built With

- Binutils 2.28
- Busybox 1.26.2
- Fakeroot 1.20.2
- File 5.30
- Gawk 4.1.4
- GCC 6.3.0
- Genext2fs 1.4.1
- Genimage 9
- Glibc 2.25
- GMP 6.1.2
- Iana-etc 2.30
- Libcap 2.25
- Libconfuse 3.0
- Linux 4.4.45
- Linux-PAM 1.3.0
- M4 1.4.18
- MPC 1.0.3
- MPFR 3.1.5
- Mtools 4.0.18
- Ncurses 6.0
- Ntp 4.2.8p9
- Openssl 1.0.2k
- Pkgconf 0.9.12
- Tzdata 2016j
- Zlib 1.2.11

### Thanks to

- [Buildroot](https://buildroot.org)
- [Cross Linux From Scratch (CLFS)](http://clfs.org)
- [PiLFS](http://www.intestinate.com/pilfs/)
