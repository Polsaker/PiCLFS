include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := sysvinit
SOURCE := $(PACKAGES_DIR)/$(NAME)/sysvinit-2.88dsf.tar.bz2

system:
	@$(STEP) "Sysvinit 2.88dsf"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/sysvinit-2.88dsf-consolidated-1.patch -d $(BUILD_DIR)/sysvinit-2.88dsf
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -C $(BUILD_DIR)/sysvinit-2.88dsf/src
	@make -j$(CONFIG_PARALLEL_JOBS) ROOT=$(ROOTFS_DIR) install -C $(BUILD_DIR)/sysvinit-2.88dsf/src
	@rm -rf $(BUILD_DIR)/sysvinit-2.88dsf
	@echo $(NAME) >> $(LOG_DIR)/system.packages
