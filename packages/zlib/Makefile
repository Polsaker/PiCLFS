SOURCE := $(PACKAGES_DIR)/zlib/zlib-1.2.11.tar.gz

toolchain:
	@$(STEP) "Zlib 1.2.11"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/zlib-1.2.11 && \
	PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" \
	PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="/" \
	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--enable-shared )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j1 -C $(BUILD_DIR)/zlib-1.2.11
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j1 LDCONFIG=true install -C $(BUILD_DIR)/zlib-1.2.11
	@rm -rf $(BUILD_DIR)/zlib-1.2.11

staging:
	@$(STEP) "Zlib 1.2.11"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/zlib-1.2.11 && CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc ./configure --prefix=/usr )
	@make -j1 -C $(BUILD_DIR)/zlib-1.2.11
	@make -j1 DESTDIR=$(SYSROOT_DIR) LDCONFIG=true install -C $(BUILD_DIR)/zlib-1.2.11
	@rm -rf $(BUILD_DIR)/zlib-1.2.11

system:
	@$(STEP) "Zlib 1.2.11"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/zlib-1.2.11 && CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc ./configure --prefix=/usr )
	@make -j1 -C $(BUILD_DIR)/zlib-1.2.11
	@make -j1 DESTDIR=$(ROOTFS_DIR) LDCONFIG=true install -C $(BUILD_DIR)/zlib-1.2.11
	@rm -rf $(BUILD_DIR)/zlib-1.2.11
