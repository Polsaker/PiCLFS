include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xkeyboard-config
SOURCE := $(PACKAGES_DIR)/$(NAME)/xkeyboard-config-2.20.tar.bz2
TARGET_DEPENDENCIES := xlib

staging:
	@$(STEP) "XKeyboard Config 2.20"
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
	@( cd $(BUILD_DIR)/xkeyboard-config-2.20 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--with-xkb-rules-symlink=xorg )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xkeyboard-config-2.20
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/xkeyboard-config-2.20
	@rm -rf $(BUILD_DIR)/xkeyboard-config-2.20
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "XKeyboard Config 2.20"
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
	@( cd $(BUILD_DIR)/xkeyboard-config-2.20 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--with-xkb-rules-symlink=xorg )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xkeyboard-config-2.20
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/xkeyboard-config-2.20
	@rm -rf $(BUILD_DIR)/xkeyboard-config-2.20
	@echo $(NAME) >> $(LOG_DIR)/system.packages
