staging:
	@$(STEP) "Create the Sysroot Directory"
	@install -dv -m 0755 $(SYSROOT_DIR)/usr/lib
	@install -dv -m 0755 $(SYSROOT_DIR)/usr/bin
	@install -dv -m 0755 $(SYSROOT_DIR)/usr/sbin
	@install -dv -m 0755 $(SYSROOT_DIR)/usr/include
	@ln -snvf usr/bin $(SYSROOT_DIR)/bin
	@ln -snvf usr/sbin $(SYSROOT_DIR)/sbin
	@ln -snvf usr/lib $(SYSROOT_DIR)/lib
	@ln -snvf lib $(SYSROOT_DIR)/lib32
	@ln -snvf lib $(SYSROOT_DIR)/usr/lib32

system:
	@$(STEP) "Creating Directories"
	@mkdir -pv $(ROOTFS_DIR)/bin
	@mkdir -pv $(ROOTFS_DIR)/boot
	@mkdir -pv $(ROOTFS_DIR)/dev
	@mkdir -pv $(ROOTFS_DIR)/etc
	@mkdir -pv $(ROOTFS_DIR)/home
	@mkdir -pv $(ROOTFS_DIR)/lib
	@mkdir -pv $(ROOTFS_DIR)/lib/firmware
	@mkdir -pv $(ROOTFS_DIR)/lib/modules
	@mkdir -pv $(ROOTFS_DIR)/mnt
	@mkdir -pv $(ROOTFS_DIR)/opt
	@mkdir -pv $(ROOTFS_DIR)/proc
	@mkdir -pv $(ROOTFS_DIR)/sbin
	@mkdir -pv $(ROOTFS_DIR)/srv
	@mkdir -pv $(ROOTFS_DIR)/sys
	@mkdir -pv $(ROOTFS_DIR)/var/cache
	@mkdir -pv $(ROOTFS_DIR)/var/lib
	@mkdir -pv $(ROOTFS_DIR)/var/local
	@mkdir -pv $(ROOTFS_DIR)/var/lock
	@mkdir -pv $(ROOTFS_DIR)/var/log
	@mkdir -pv $(ROOTFS_DIR)/var/opt
	@mkdir -pv $(ROOTFS_DIR)/var/run
	@mkdir -pv $(ROOTFS_DIR)/var/spool
	@install -dv -m 0750 $(ROOTFS_DIR)/root
	@install -dv -m 1777 $(ROOTFS_DIR)/tmp
	@mkdir -pv $(ROOTFS_DIR)/usr
	@mkdir -pv $(ROOTFS_DIR)/usr/bin
	@mkdir -pv $(ROOTFS_DIR)/usr/include
	@mkdir -pv $(ROOTFS_DIR)/usr/lib
	@mkdir -pv $(ROOTFS_DIR)/usr/local
	@mkdir -pv $(ROOTFS_DIR)/usr/local/bin
	@mkdir -pv $(ROOTFS_DIR)/usr/local/include
	@mkdir -pv $(ROOTFS_DIR)/usr/local/lib
	@mkdir -pv $(ROOTFS_DIR)/usr/local/sbin
	@mkdir -pv $(ROOTFS_DIR)/usr/local/share
	@mkdir -pv $(ROOTFS_DIR)/usr/local/src
	@mkdir -pv $(ROOTFS_DIR)/usr/sbin
	@mkdir -pv $(ROOTFS_DIR)/usr/share
	@mkdir -pv $(ROOTFS_DIR)/usr/src
	@touch $(ROOTFS_DIR)/var/run/utmp
	@touch $(ROOTFS_DIR)/var/log/btmp
	@touch $(ROOTFS_DIR)/var/log/lastlog
	@touch $(ROOTFS_DIR)/var/log/wtmp
	@chmod -v 664 $(ROOTFS_DIR)/var/run/utmp $(ROOTFS_DIR)/var/log/lastlog
	@$(STEP) "Creating the passwd, shadow, group, and log File"
	@ln -svf ../proc/mounts $(ROOTFS_DIR)/etc/mtab
	@cp -v $(PACKAGES_DIR)/skeleton/passwd $(ROOTFS_DIR)/etc/passwd
	@cp -v $(PACKAGES_DIR)/skeleton/group $(ROOTFS_DIR)/etc/group
	@cp -v $(PACKAGES_DIR)/skeleton/shadow $(ROOTFS_DIR)/etc/shadow
	@sed -i -e s,^root:[^:]*:,root:"`$(TOOLS_DIR)/usr/bin/mkpasswd -m "sha-512" "$(CONFIG_ROOT_PASSWD)"`":, $(ROOTFS_DIR)/etc/shadow
	@$(STEP) "Configure mdev"
	@cp -v $(PACKAGES_DIR)/skeleton/mdev.conf $(ROOTFS_DIR)/etc/mdev.conf
	@$(STEP) "Creating /etc/fstab"
	@cp -v $(PACKAGES_DIR)/skeleton/fstab $(ROOTFS_DIR)/etc/fstab
	@$(STEP) "Creating /etc/profile"
	@cp -v $(PACKAGES_DIR)/skeleton/profile $(ROOTFS_DIR)/etc/profile
	@$(STEP) "Creating /etc/profile.d"
	@mkdir -p $(ROOTFS_DIR)/etc/profile.d
	@$(STEP) "Creating /etc/inittab"
	@cp -v $(PACKAGES_DIR)/skeleton/inittab $(ROOTFS_DIR)/etc/inittab
	@$(STEP) "Setting hostname"
	@echo $(CONFIG_HOSTNAME) >> $(ROOTFS_DIR)/etc/HOSTNAME
	@$(STEP) "Creating /etc/hosts"
	@cp -v $(PACKAGES_DIR)/skeleton/hosts $(ROOTFS_DIR)/etc/hosts
	@$(STEP) "Configuring the network script"
	@mkdir -pv $(ROOTFS_DIR)/etc/network/if-down.d
	@mkdir -pv $(ROOTFS_DIR)/etc/network/if-post-down.d
	@mkdir -pv $(ROOTFS_DIR)/etc/network/if-post-up.d
	@mkdir -pv $(ROOTFS_DIR)/etc/network/if-pre-down.d
	@mkdir -pv $(ROOTFS_DIR)/etc/network/if-pre-up.d
	@mkdir -pv $(ROOTFS_DIR)/etc/network/if-up.d
	@mkdir -pv $(ROOTFS_DIR)/usr/share/udhcpc
	@cp -v $(PACKAGES_DIR)/skeleton/interfaces $(ROOTFS_DIR)/etc/network/interfaces
	@cp -v $(PACKAGES_DIR)/skeleton/default.script $(ROOTFS_DIR)/usr/share/udhcpc/default.script
	@chmod +x $(ROOTFS_DIR)/usr/share/udhcpc/default.script
	@cp -v $(PACKAGES_DIR)/skeleton/resolv.conf $(ROOTFS_DIR)/etc/resolv.conf
