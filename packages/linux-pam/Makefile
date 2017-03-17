SOURCE := $(PACKAGES_DIR)/linux-pam/Linux-PAM-1.3.0.tar.bz2

staging:
	@$(STEP) "Linux-PAM 1.3.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/Linux-PAM-1.3.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc \
	--libdir=/usr/lib \
	--disable-regenerate-docu \
	--enable-securedir=/lib/security \
	--docdir=/usr/share/doc/Linux-PAM-1.3.0 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/Linux-PAM-1.3.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(SYSROOT_DIR) install -C $(BUILD_DIR)/Linux-PAM-1.3.0
	@rm -rf $(BUILD_DIR)/Linux-PAM-1.3.0

system:
	@$(STEP) "Linux-PAM 1.3.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/Linux-PAM-1.3.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc \
	--libdir=/usr/lib \
	--disable-regenerate-docu \
	--enable-securedir=/lib/security \
	--docdir=/usr/share/doc/Linux-PAM-1.3.0 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/Linux-PAM-1.3.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/Linux-PAM-1.3.0
	@chmod -v 4755 $(ROOTFS_DIR)/sbin/unix_chkpwd
	@for file in pam pam_misc pamc ; do \
		mv -v $(ROOTFS_DIR)/usr/lib/lib$${file}.so.* $(ROOTFS_DIR)/lib && \
		ln -sfv ../../lib/`readlink $(ROOTFS_DIR)/usr/lib/lib$${file}.so` $(ROOTFS_DIR)/usr/lib/lib$${file}.so ; \
	done
	@install -v -m755 -d $(ROOTFS_DIR)/etc/pam.d
	@cp -v $(PACKAGES_DIR)/linux-pam/system-account $(ROOTFS_DIR)/etc/pam.d/
	@cp -v $(PACKAGES_DIR)/linux-pam/system-auth $(ROOTFS_DIR)/etc/pam.d/
	@cp -v $(PACKAGES_DIR)/linux-pam/system-session $(ROOTFS_DIR)/etc/pam.d/
	@cp -v $(PACKAGES_DIR)/linux-pam/system-password $(ROOTFS_DIR)/etc/pam.d/
	@cp -v $(PACKAGES_DIR)/linux-pam/other $(ROOTFS_DIR)/etc/pam.d/
	@rm -rf $(BUILD_DIR)/Linux-PAM-1.3.0
