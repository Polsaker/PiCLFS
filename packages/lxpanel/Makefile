include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := lxpanel
SOURCE := $(PACKAGES_DIR)/$(NAME)/lxpanel-0.9.3.tar.xz
TARGET_DEPENDENCIES := keybinder2 libwnck lxmenu-data menu-cache libxml2 wireless_tools

staging:
	@$(STEP) "LXPanel 0.9.3"
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
	@( cd $(BUILD_DIR)/lxpanel-0.9.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/lxpanel-0.9.3
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/lxpanel-0.9.3
	@rm -rf $(BUILD_DIR)/lxpanel-0.9.3
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "LXPanel 0.9.3"
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
	@( cd $(BUILD_DIR)/lxpanel-0.9.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/lxpanel-0.9.3
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/lxpanel-0.9.3
	@rm -rf $(BUILD_DIR)/lxpanel-0.9.3
	@echo $(NAME) >> $(LOG_DIR)/system.packages
