include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := pango
SOURCE := $(PACKAGES_DIR)/$(NAME)/pango-1.40.5.tar.xz
HOST_DEPENDENCIES := fontconfig freetype harfbuzz glib
TARGET_DEPENDENCIES := fontconfig freetype harfbuzz glib

staging:
	@$(STEP) "Pango 1.40.5"
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
	@sed -i "/seems to be moved/s/^/#/" $(BUILD_DIR)/pango-1.40.5/ltmain.sh
	@( cd $(BUILD_DIR)/pango-1.40.5 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pango-1.40.5
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/pango-1.40.5
	@rm -rf $(BUILD_DIR)/pango-1.40.5
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Pango 1.40.5"
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
	@sed -i "/seems to be moved/s/^/#/" $(BUILD_DIR)/pango-1.40.5/ltmain.sh
	@( cd $(BUILD_DIR)/pango-1.40.5 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--sysconfdir=/etc )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pango-1.40.5
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/pango-1.40.5
	@rm -rf $(BUILD_DIR)/pango-1.40.5
	@echo $(NAME) >> $(LOG_DIR)/system.packages
