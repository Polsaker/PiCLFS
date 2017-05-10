include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := wireless_tools
SOURCE := $(PACKAGES_DIR)/$(NAME)/wireless_tools.29.tar.gz

staging:
	@$(STEP) "Wireless Tools 29"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/wireless_tools-29-fix_iwlist_scanning-1.patch -d $(BUILD_DIR)/wireless_tools.29
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib -C $(BUILD_DIR)/wireless_tools.29
	@make -j$(CONFIG_PARALLEL_JOBS) PREFIX=$(SYSROOT_DIR)/usr INSTALL_MAN=$(SYSROOT_DIR)/usr/share/man install -C $(BUILD_DIR)/wireless_tools.29
	@rm -rf $(BUILD_DIR)/wireless_tools.29
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Wireless Tools 29"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/wireless_tools-29-fix_iwlist_scanning-1.patch -d $(BUILD_DIR)/wireless_tools.29
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib -C $(BUILD_DIR)/wireless_tools.29
	@make -j$(CONFIG_PARALLEL_JOBS) PREFIX=$(ROOTFS_DIR)/usr INSTALL_MAN=$(ROOTFS_DIR)/usr/share/man install -C $(BUILD_DIR)/wireless_tools.29
	@rm -rf $(BUILD_DIR)/wireless_tools.29
	@echo $(NAME) >> $(LOG_DIR)/system.packages
