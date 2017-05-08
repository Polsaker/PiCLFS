include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libxml2
SOURCE := $(PACKAGES_DIR)/$(NAME)/libxml2-2.9.4.tar.gz
TARGET_DEPENDENCIES := python

toolchain:
	@$(STEP) "libxml2 2.9.4"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/libxml2-2.9.4 && \
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
	--disable-static \
	--without-zlib \
	--without-lzma \
	--without-python )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libxml2-2.9.4
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libxml2-2.9.4
	@rm -rf $(BUILD_DIR)/libxml2-2.9.4
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "libxml2 2.9.4"
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
	@( cd $(BUILD_DIR)/libxml2-2.9.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--with-gnu-ld \
	--without-python \
	--without-debug \
	--with-history )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libxml2-2.9.4
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libxml2-2.9.4
	@rm -rf $(BUILD_DIR)/libxml2-2.9.4
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "libxml2 2.9.4"
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
	@( cd $(BUILD_DIR)/libxml2-2.9.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--disable-static \
	--with-gnu-ld \
	--without-python \
	--without-debug \
	--with-history )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libxml2-2.9.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/libxml2-2.9.4
	@rm -rf $(BUILD_DIR)/libxml2-2.9.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
