NAME := glibc
SOURCE := $(PACKAGES_DIR)/$(NAME)/glibc-2.25.tar.xz

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
	@echo "#include <gnu/stubs-hard.h>" > $(SYSROOT_DIR)/usr/include/gnu/stubs.h
	@cp -v $(PACKAGES_DIR)/glibc/ld.so.conf $(SYSROOT_DIR)/etc/ld.so.conf
	@cp -v $(BUILD_DIR)/glibc-2.25/nscd/nscd.conf $(SYSROOT_DIR)/etc/nscd.conf
	@mkdir -pv $(SYSROOT_DIR)/var/cache/nscd
	@rm -rf $(BUILD_DIR)/glibc-2.25
	@echo $(NAME) >> $(LOG_DIR)/staging.packages


system:
	@$(STEP) "Glibc 2.25"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/glibc-2.25/glibc-build
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/glibc-2.25-fhs-1.patch -d $(BUILD_DIR)/glibc-2.25
	@( cd $(BUILD_DIR)/glibc-2.25/glibc-build && \
	AR="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar" \
	CC="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc" \
	RANLIB="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib" \
	BUILD_CC="gcc" \
	$(BUILD_DIR)/glibc-2.25/configure \
	libc_cv_slibdir=/lib \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--with-pkgversion="$(CONFIG_PKG_VERSION)" \
	--prefix=/usr \
	--enable-obsolete-rpc \
	--enable-kernel=4.4.45 \
	--enable-stack-protector=strong \
	--with-headers=$(SYSROOT_DIR)/usr/include )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/glibc-2.25/glibc-build
	@touch $(ROOTFS_DIR)/etc/ld.so.conf
	@make -j$(CONFIG_PARALLEL_JOBS) install_root=$(ROOTFS_DIR) install -C $(BUILD_DIR)/glibc-2.25/glibc-build
	@cp -v $(BUILD_DIR)/glibc-2.25/nscd/nscd.conf $(ROOTFS_DIR)/etc/nscd.conf
	@mkdir -pv $(ROOTFS_DIR)/var/cache/nscd
	@cp -v $(PACKAGES_DIR)/$(NAME)/nsswitch.conf $(ROOTFS_DIR)/etc/nsswitch.conf
	@cp -v $(PACKAGES_DIR)/$(NAME)/ld.so.conf $(ROOTFS_DIR)/etc/ld.so.conf
	@mkdir -pv $(ROOTFS_DIR)/etc/ld.so.conf.d
	@ln -svf ld-2.25.so $(ROOTFS_DIR)/lib/ld-linux.so.3
	@rm -rf $(BUILD_DIR)/glibc-2.25
	@echo $(NAME) >> $(LOG_DIR)/system.packages
