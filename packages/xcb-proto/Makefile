include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xcb-proto
SOURCE := $(PACKAGES_DIR)/$(NAME)/xcb-proto-1.12.tar.bz2
TARGET_DEPENDENCIES := python

staging:
	@$(STEP) "xcb-proto 1.12"
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
	@patch -Np1 -i $(PACKAGES_DIR)/xcb-proto/xcb-proto-1.12-schema-1.patch -d $(BUILD_DIR)/xcb-proto-1.12
	@( cd $(BUILD_DIR)/xcb-proto-1.12 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xcb-proto-1.12
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/xcb-proto-1.12
	@rm -rf $(BUILD_DIR)/xcb-proto-1.12
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "xcb-proto 1.12"
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
	@patch -Np1 -i $(PACKAGES_DIR)/xcb-proto/xcb-proto-1.12-schema-1.patch -d $(BUILD_DIR)/xcb-proto-1.12
	@( cd $(BUILD_DIR)/xcb-proto-1.12 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xcb-proto-1.12
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/xcb-proto-1.12
	@rm -rf $(BUILD_DIR)/xcb-proto-1.12
	@echo $(NAME) >> $(LOG_DIR)/system.packages
