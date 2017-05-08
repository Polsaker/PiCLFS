NAME := zlib
SOURCE := $(PACKAGES_DIR)/$(NAME)/zlib-1.2.11.tar.gz

toolchain:
	@$(STEP) "Zlib 1.2.11"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/zlib-1.2.11 && \
	CFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	CPPFLAGS="-I$(TOOLS_DIR)/usr/include" \
	CXXFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
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
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "Zlib 1.2.11"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/zlib-1.2.11 && CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc ./configure --prefix=$(SYSROOT_DIR)/usr )
	@make -j1 -C $(BUILD_DIR)/zlib-1.2.11
	@make -j1 LDCONFIG=true install -C $(BUILD_DIR)/zlib-1.2.11
	@rm -rf $(BUILD_DIR)/zlib-1.2.11
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Zlib 1.2.11"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/zlib-1.2.11 && CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc ./configure --prefix=/usr )
	@make -j1 -C $(BUILD_DIR)/zlib-1.2.11
	@make -j1 DESTDIR=$(ROOTFS_DIR) LDCONFIG=true install -C $(BUILD_DIR)/zlib-1.2.11
	@rm -rf $(BUILD_DIR)/zlib-1.2.11
	@echo $(NAME) >> $(LOG_DIR)/system.packages
