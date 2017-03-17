SOURCE := $(PACKAGES_DIR)/pkgconf/pkgconf-0.9.12.tar.bz2

toolchain:
	@$(STEP) "Pkgconf 0.9.12"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/pkgconf-0.9.12 && \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--enable-shared \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pkgconf-0.9.12
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/pkgconf-0.9.12
	@install -v -m755 $(PACKAGES_DIR)/pkgconf/pkg-config $(TOOLS_DIR)/usr/bin/pkg-config
	@sed -i -e "s,@PKG_CONFIG_LIBDIR@,$(TOOLS_DIR)/usr/$(CONFIG_TARGET)/sysroot/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/$(CONFIG_TARGET)/sysroot/usr/share/pkgconfig," -e "s,@STAGING_DIR@,$(TOOLS_DIR)/usr/$(CONFIG_TARGET)/sysroot," $(TOOLS_DIR)/usr/bin/pkg-config
	@sed -i -e "s,@STATIC@,," $(TOOLS_DIR)/usr/bin/pkg-config
	@rm -rf $(BUILD_DIR)/pkgconf-0.9.12
