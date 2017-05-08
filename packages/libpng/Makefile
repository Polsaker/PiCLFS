include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libpng
SOURCE := $(PACKAGES_DIR)/$(NAME)/libpng-1.6.29.tar.xz
HOST_DEPENDENCIES := zlib
TARGET_DEPENDENCIES := zlib

toolchain:
	@$(STEP) "libpng 1.6.29"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/libpng-1.6.29 && \
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
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--enable-shared \
	--disable-static )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libpng-1.6.29
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libpng-1.6.29
	@rm -rf $(BUILD_DIR)/libpng-1.6.29
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "libpng 1.6.29"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@patch -Np0 -i $(PACKAGES_DIR)/libpng/libpng-1.6.29-apng.patch -d $(BUILD_DIR)/libpng-1.6.29
	@( cd $(BUILD_DIR)/libpng-1.6.29 && \
	LIBS=-lpthread \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--enable-shared \
	--enable-arm-neon=yes )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libpng-1.6.29
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libpng-1.6.29
	@rm -rf $(BUILD_DIR)/libpng-1.6.29
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "libpng 1.6.29"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@patch -Np0 -i $(PACKAGES_DIR)/libpng/libpng-1.6.29-apng.patch -d $(BUILD_DIR)/libpng-1.6.29
	@( cd $(BUILD_DIR)/libpng-1.6.29 && \
	LIBS=-lpthread \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--disable-static \
	--enable-shared \
	--enable-arm-neon=yes )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libpng-1.6.29
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/libpng-1.6.29
	@rm -rf $(BUILD_DIR)/libpng-1.6.29
	@echo $(NAME) >> $(LOG_DIR)/system.packages
