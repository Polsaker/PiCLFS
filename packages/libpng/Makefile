include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libpng
SOURCE := $(PACKAGES_DIR)/$(NAME)/libpng-1.6.29.tar.xz
TARGET_DEPENDENCIES := zlib

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
