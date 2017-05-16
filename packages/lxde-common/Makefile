include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := lxde-common
SOURCE := $(PACKAGES_DIR)/$(NAME)/lxde-common-0.99.2.tar.xz
TARGET_DEPENDENCIES := lxpanel lxsession pcmanfm dbus hicolor-icon-theme

staging:
	@$(STEP) "LXDE Common 0.99.2"
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
	@( cd $(BUILD_DIR)/lxde-common-0.99.2 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/lxde-common-0.99.2
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/lxde-common-0.99.2
	@rm -rf $(BUILD_DIR)/lxde-common-0.99.2
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "LXDE Common 0.99.2"
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
	@( cd $(BUILD_DIR)/lxde-common-0.99.2 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/lxde-common-0.99.2
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/lxde-common-0.99.2
	@mkdir -p $(ROOTFS_DIR)/etc/X11/xinit
	@cp -v $(PACKAGES_DIR)/$(NAME)/xinitrc $(ROOTFS_DIR)/etc/X11/xinit/xinitrc
	@rm -rf $(BUILD_DIR)/lxde-common-0.99.2
	@echo $(NAME) >> $(LOG_DIR)/system.packages
