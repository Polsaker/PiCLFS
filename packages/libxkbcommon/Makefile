include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libxkbcommon
SOURCE := $(PACKAGES_DIR)/$(NAME)/libxkbcommon-0.7.1.tar.xz

staging:
	@$(STEP) "libxkbcommon 0.7.1"
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
	@( cd $(BUILD_DIR)/libxkbcommon-0.7.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--with-xkb-config-root=/usr/share/X11/xkb \
	--disable-x11 \
	--disable-wayland )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libxkbcommon-0.7.1
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libxkbcommon-0.7.1
	@rm -rf $(BUILD_DIR)/libxkbcommon-0.7.1
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "libxkbcommon 0.7.1"
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
	@( cd $(BUILD_DIR)/libxkbcommon-0.7.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--with-xkb-config-root=/usr/share/X11/xkb \
	--disable-x11 \
	--disable-wayland )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libxkbcommon-0.7.1
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/libxkbcommon-0.7.1
	@rm -rf $(BUILD_DIR)/libxkbcommon-0.7.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
