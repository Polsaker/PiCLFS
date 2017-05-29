include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := firmware
SOURCE := $(PACKAGES_DIR)/firmware/rpi-firmware.part*

staging:
	@$(STEP) "Raspberry Pi Firmware"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(SOURCE) | tar zxf -  -C $(BUILD_DIR)
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/bin $(SYSROOT_DIR)/usr
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/include $(SYSROOT_DIR)/usr
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/lib $(SYSROOT_DIR)/usr
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/sbin $(SYSROOT_DIR)/usr
	@rm -rf $(BUILD_DIR)/firmware-master
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Raspberry Pi Firmware"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(SOURCE) | tar zxf -  -C $(BUILD_DIR)
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/bin $(ROOTFS_DIR)/usr
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/include $(ROOTFS_DIR)/usr
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/lib $(ROOTFS_DIR)/usr
	@cp -rv $(BUILD_DIR)/firmware-master/hardfp/opt/vc/sbin $(ROOTFS_DIR)/usr
	@rm -rf $(BUILD_DIR)/firmware-master
	@echo $(NAME) >> $(LOG_DIR)/system.packages
