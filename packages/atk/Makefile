include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := atk
SOURCE := $(PACKAGES_DIR)/$(NAME)/atk-2.24.0.tar.xz
TARGET_DEPENDENCIES := glib

staging:
	@$(STEP) "ATK 2.24.0"
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
	@( cd $(BUILD_DIR)/atk-2.24.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--enable-shared \
	--disable-glibtest \
	--enable-explicit-deps=no )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/atk-2.24.0
	@make -j$(CONFIG_PARALLEL_JOBS) LDFLAGS=-L$(SYSROOT_DIR)/usr/lib install -C $(BUILD_DIR)/atk-2.24.0
	@rm -rf $(BUILD_DIR)/atk-2.24.0
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "ATK 2.24.0"
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
	@( cd $(BUILD_DIR)/atk-2.24.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-static \
	--enable-shared \
	--disable-glibtest \
	--enable-explicit-deps=no )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/atk-2.24.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/atk-2.24.0
	@rm -rf $(BUILD_DIR)/atk-2.24.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
