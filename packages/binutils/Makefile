include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := binutils
SOURCE := $(PACKAGES_DIR)/$(NAME)/binutils-2.28.tar.gz
TARGET_DEPENDENCIES := zlib

toolchain:
	@$(STEP) "Binutils 2.28"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -pv $(BUILD_DIR)/binutils-2.28/binutils-build
	@( cd $(BUILD_DIR)/binutils-2.28/binutils-build && \
	AR="ar" \
	AS="as" \
	$(BUILD_DIR)/binutils-2.28/configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--disable-multilib \
	--disable-werror \
	--target=$(CONFIG_TARGET) \
	--disable-shared \
	--enable-static \
	--with-sysroot=$(SYSROOT_DIR) \
	--enable-poison-system-directories \
	--disable-sim \
	--disable-gdb )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@rm -rf $(BUILD_DIR)/binutils-2.28
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "Binutils 2.28"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -pv $(BUILD_DIR)/binutils-2.28/binutils-build
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/binutils-2.28/binutils-build && \
	$(BUILD_DIR)/binutils-2.28/configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--enable-gold \
	--enable-ld=default \
	--enable-plugins \
	--enable-shared \
	--disable-werror \
	--with-system-zlib )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@rm -rf $(BUILD_DIR)/binutils-2.28
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Binutils 2.28"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -pv $(BUILD_DIR)/binutils-2.28/binutils-build
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/binutils-2.28/binutils-build && \
	$(BUILD_DIR)/binutils-2.28/configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--enable-gold \
	--enable-ld=default \
	--enable-plugins \
	--enable-shared \
	--disable-werror \
	--with-system-zlib )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@rm -rf $(BUILD_DIR)/binutils-2.28
	@echo $(NAME) >> $(LOG_DIR)/system.packages
