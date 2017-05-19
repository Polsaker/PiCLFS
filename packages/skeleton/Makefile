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
	@$(PACKAGES_DIR)/skeleton/create_directories.sh $(ROOTFS_DIR)
	@$(STEP) "Creating Essential Files and Symlinks"
	@ln -svf /proc/self/mounts $(ROOTFS_DIR)/etc/mtab
	@$(STEP) "Creating the passwd, shadow, group, and log File"
	@cp -v $(PACKAGES_DIR)/skeleton/passwd $(ROOTFS_DIR)/etc/passwd
	@cp -v $(PACKAGES_DIR)/skeleton/group $(ROOTFS_DIR)/etc/group
	@cp -v $(PACKAGES_DIR)/skeleton/shadow $(ROOTFS_DIR)/etc/shadow
	@sed -i -e s,^root:[^:]*:,root:"`$(TOOLS_DIR)/usr/bin/mkpasswd -m "sha-512" "$(CONFIG_ROOT_PASSWD)"`":, $(ROOTFS_DIR)/etc/shadow
	@$(STEP) "Creating the hostname, hosts, resolv.conf"
	@echo "$(CONFIG_HOSTNAME)" > $(ROOTFS_DIR)/etc/hostname
	@cp -v $(PACKAGES_DIR)/skeleton/hosts $(ROOTFS_DIR)/etc/hosts
	@cp -v $(PACKAGES_DIR)/skeleton/resolv.conf $(ROOTFS_DIR)/etc/resolv.conf
	@$(STEP) "Creating the dhcp.eth0, ifconfig.eth0"
	@cp -v $(PACKAGES_DIR)/skeleton/dhcp.eth0 $(ROOTFS_DIR)/etc/sysconfig/dhcp.eth0
	@cp -v $(PACKAGES_DIR)/skeleton/ifconfig.eth0 $(ROOTFS_DIR)/etc/sysconfig/ifconfig.eth0
	@$(STEP) "Creating the inittab"
	@cp -v $(PACKAGES_DIR)/skeleton/inittab $(ROOTFS_DIR)/etc/inittab
	@$(STEP) "Creating the clock"
	@cp -v $(PACKAGES_DIR)/skeleton/clock $(ROOTFS_DIR)/etc/sysconfig/clock
	@$(STEP) "Creating the rc.site"
	@cp -v $(PACKAGES_DIR)/skeleton/rc.site $(ROOTFS_DIR)/etc/sysconfig/rc.site
	@$(STEP) "Creating the inputrc"
	@cp -v $(PACKAGES_DIR)/skeleton/inputrc $(ROOTFS_DIR)/etc/inputrc
	@$(STEP) "Creating the shells"
	@cp -v $(PACKAGES_DIR)/skeleton/shells $(ROOTFS_DIR)/etc/shells
	@$(STEP) "Creating the fstab"
	@cp -v $(PACKAGES_DIR)/skeleton/fstab $(ROOTFS_DIR)/etc/fstab
	@$(STEP) "Creating the profile"
	@cp -v $(PACKAGES_DIR)/skeleton/profile $(ROOTFS_DIR)/etc/profile
	@$(STEP) "Creating the bashrc"
	@cp -v $(PACKAGES_DIR)/skeleton/bashrc $(ROOTFS_DIR)/etc/bashrc
	@$(STEP) "Creating the /etc/profile.d"
	@mkdir -v $(ROOTFS_DIR)/etc/profile.d
	@cp -v $(PACKAGES_DIR)/skeleton/dircolors.sh $(ROOTFS_DIR)/etc/profile.d/dircolors.sh
	@cp -v $(PACKAGES_DIR)/skeleton/extrapaths.sh $(ROOTFS_DIR)/etc/profile.d/extrapaths.sh
	@cp -v $(PACKAGES_DIR)/skeleton/readline.sh $(ROOTFS_DIR)/etc/profile.d/readline.sh
	@cp -v $(PACKAGES_DIR)/skeleton/umask.sh $(ROOTFS_DIR)/etc/profile.d/umask.sh
	@cp -v $(PACKAGES_DIR)/skeleton/i18n.sh $(ROOTFS_DIR)/etc/profile.d/i18n.sh
	@$(STEP) "Creating the fake-hwclock.data"
	@echo `date +%Y-%m-%d\ %H:%M:%S` > $(ROOTFS_DIR)/etc/fake-hwclock.data
