include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := lxappearance
SOURCE := $(PACKAGES_DIR)/$(NAME)/lxappearance-0.6.3.tar.xz
TARGET_DEPENDENCIES := libgtk2 dbus-glib

system:
	@$(STEP) "LXAppearance 0.6.3"
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
	@( cd $(BUILD_DIR)/lxappearance-0.6.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc \
	--disable-static \
	--enable-dbus )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/lxappearance-0.6.3
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/lxappearance-0.6.3
	@rm -rf $(BUILD_DIR)/lxappearance-0.6.3
	@echo $(NAME) >> $(LOG_DIR)/system.packages
