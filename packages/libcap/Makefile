NAME := libcap
SOURCE := $(PACKAGES_DIR)/$(NAME)/libcap-2.25.tar.xz

toolchain:
	@$(STEP) "libcap 2.25"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) RAISE_SETFCAP=no -C $(BUILD_DIR)/libcap-2.25
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(TOOLS_DIR) RAISE_SETFCAP=no prefix=/usr lib=lib install -C $(BUILD_DIR)/libcap-2.25
	@rm -rf $(BUILD_DIR)/libcap-2.25
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "libcap 2.25"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@patch -Np1 -i $(PACKAGES_DIR)/libcap/libcap-2.25-build-system-fixes-for-cross-compilation.patch -d $(BUILD_DIR)/libcap-2.25
	@CC="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc" AR="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar" LD="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld" RANLIB="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib" BUILD_CC="gcc" BUILD_CFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libcap-2.25/libcap
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(SYSROOT_DIR) prefix=/usr lib=lib install -C $(BUILD_DIR)/libcap-2.25/libcap
	@rm -rf $(BUILD_DIR)/libcap-2.25
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "libcap 2.25"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@patch -Np1 -i $(PACKAGES_DIR)/libcap/libcap-2.25-build-system-fixes-for-cross-compilation.patch -d $(BUILD_DIR)/libcap-2.25
	@CC="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc" AR="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar" LD="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld" RANLIB="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib" BUILD_CC="gcc" BUILD_CFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libcap-2.25/libcap
	@make -j$(CONFIG_PARALLEL_JOBS) CC="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc" DESTDIR=$(ROOTFS_DIR) prefix=/usr lib=lib install -C $(BUILD_DIR)/libcap-2.25/libcap
	@rm -rf $(BUILD_DIR)/libcap-2.25
	@echo $(NAME) >> $(LOG_DIR)/system.packages
