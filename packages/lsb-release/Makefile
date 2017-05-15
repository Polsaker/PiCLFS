include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := lsb-release
SOURCE := $(PACKAGES_DIR)/$(NAME)/lsb-release-1.4.tar.gz

staging:
	@$(STEP) "lsb-release 1.4"
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
	@sed -i "s|n/a|unavailable|" $(BUILD_DIR)/lsb-release-1.4/lsb_release
	@install -v -m 755 $(BUILD_DIR)/lsb-release-1.4/lsb_release $(SYSROOT_DIR)/usr/bin/lsb_release
	@rm -rf $(BUILD_DIR)/lsb-release-1.4
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "lsb-release 1.4"
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
	@sed -i "s|n/a|unavailable|" $(BUILD_DIR)/lsb-release-1.4/lsb_release
	@install -v -m 755 $(BUILD_DIR)/lsb-release-1.4/lsb_release $(ROOTFS_DIR)/usr/bin/lsb_release
	@rm -rf $(BUILD_DIR)/lsb-release-1.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
