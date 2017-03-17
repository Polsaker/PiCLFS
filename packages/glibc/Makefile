SOURCE := $(PACKAGES_DIR)/glibc/glibc-2.25.tar.xz

staging:
	@$(STEP) "Glibc 2.25"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/glibc-2.25/glibc-build
	@( cd $(BUILD_DIR)/glibc-2.25/glibc-build && \
	AR="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar" \
	CC="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc" \
	RANLIB="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib" \
	BUILD_CC="gcc" \
	$(BUILD_DIR)/glibc-2.25/configure \
	libc_cv_forced_unwind=yes \
	libc_cv_ssp=no \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--with-pkgversion="$(CONFIG_PKG_VERSION)" \
	--prefix=/usr \
	--enable-obsolete-rpc \
	--enable-kernel=4.4.45 \
	--with-headers=$(SYSROOT_DIR)/usr/include )
	@mkdir -p $(SYSROOT_DIR)/usr/include/gnu
	@touch $(SYSROOT_DIR)/usr/include/gnu/stubs.h
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/glibc-2.25/glibc-build
	@make -j$(CONFIG_PARALLEL_JOBS) install_root=$(SYSROOT_DIR) install -C $(BUILD_DIR)/glibc-2.25/glibc-build
	@cp -v $(PACKAGES_DIR)/glibc/ld.so.conf $(SYSROOT_DIR)/etc/ld.so.conf
	@cp -v $(BUILD_DIR)/glibc-2.25/nscd/nscd.conf $(SYSROOT_DIR)/etc/nscd.conf
	@mkdir -pv $(SYSROOT_DIR)/var/cache/nscd
	@rm -rf $(BUILD_DIR)/glibc-2.25


system:
	@$(STEP) "Glibc 2.25"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/glibc-2.25/glibc-build
	@( cd $(BUILD_DIR)/glibc-2.25/glibc-build && \
	AR="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar" \
	CC="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc" \
	RANLIB="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib" \
	BUILD_CC="gcc" \
	$(BUILD_DIR)/glibc-2.25/configure \
	libc_cv_forced_unwind=yes \
	libc_cv_ssp=no \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--with-pkgversion="$(CONFIG_PKG_VERSION)" \
	--prefix=/usr \
	--enable-obsolete-rpc \
	--enable-kernel=4.4.45 \
	--with-headers=$(SYSROOT_DIR)/usr/include )
	@mkdir -p $(ROOTFS_DIR)/usr/include/gnu
	@touch $(ROOTFS_DIR)/usr/include/gnu/stubs.h
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/glibc-2.25/glibc-build
	@make -j$(CONFIG_PARALLEL_JOBS) install_root=$(ROOTFS_DIR) install -C $(BUILD_DIR)/glibc-2.25/glibc-build
	@cp -v $(PACKAGES_DIR)/glibc/ld.so.conf $(ROOTFS_DIR)/etc/ld.so.conf
	@cp -v $(BUILD_DIR)/glibc-2.25/nscd/nscd.conf $(ROOTFS_DIR)/etc/nscd.conf
	@mkdir -pv $(ROOTFS_DIR)/var/cache/nscd
	@rm -rf $(BUILD_DIR)/glibc-2.25
