include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libunique
SOURCE := $(PACKAGES_DIR)/$(NAME)/libunique-1.1.6.tar.bz2
TARGET_DEPENDENCIES := libgtk2

staging:
	@$(STEP) "libunique 1.1.6"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/libunique-1.1.6-upstream_fixes-1.patch -d $(BUILD_DIR)/libunique-1.1.6
	@( cd $(BUILD_DIR)/libunique-1.1.6 && autoreconf -fi )
	@( cd $(BUILD_DIR)/libunique-1.1.6 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--disable-dbus \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libunique-1.1.6
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libunique-1.1.6
	@rm -rf $(BUILD_DIR)/libunique-1.1.6
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "libunique 1.1.6"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/libunique-1.1.6-upstream_fixes-1.patch -d $(BUILD_DIR)/libunique-1.1.6
	@( cd $(BUILD_DIR)/libunique-1.1.6 && autoreconf -fi )
	@( cd $(BUILD_DIR)/libunique-1.1.6 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-dbus \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libunique-1.1.6
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/libunique-1.1.6
	@rm -rf $(BUILD_DIR)/libunique-1.1.6
	@echo $(NAME) >> $(LOG_DIR)/system.packages
