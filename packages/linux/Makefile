NAME := linux-header

staging:
	@$(STEP) "Linux 4.4.45 API Headers"
	@cat $(PACKAGES_DIR)/linux/rpi-4.4.y.part* | tar zxf -  -C $(BUILD_DIR)
	@make mrproper -C $(BUILD_DIR)/linux-rpi-4.4.y
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) headers_check -C $(BUILD_DIR)/linux-rpi-4.4.y
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=arm INSTALL_HDR_PATH=$(SYSROOT_DIR)/usr headers_install -C $(BUILD_DIR)/linux-rpi-4.4.y
	@rm -rf $(BUILD_DIR)/linux-rpi-4.4.y
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Linux 4.4.45 API Headers"
	@cat $(PACKAGES_DIR)/linux/rpi-4.4.y.part* | tar zxf -  -C $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/linux-rpi-4.4.y/dest
	@make mrproper -C $(BUILD_DIR)/linux-rpi-4.4.y
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) headers_check -C $(BUILD_DIR)/linux-rpi-4.4.y
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=arm INSTALL_HDR_PATH=$(BUILD_DIR)/linux-rpi-4.4.y/dest headers_install -C $(BUILD_DIR)/linux-rpi-4.4.y
	@find $(BUILD_DIR)/linux-rpi-4.4.y/dest/include \( -name .install -o -name ..install.cmd \) -delete
	@cp -rv $(BUILD_DIR)/linux-rpi-4.4.y/dest/include/* $(ROOTFS_DIR)/usr/include
	@rm -rf $(BUILD_DIR)/linux-rpi-4.4.y
	@echo $(NAME) >> $(LOG_DIR)/system.packages

kernel:
	@$(STEP) "Linux 4.4.45 Kernel"
	@cat $(PACKAGES_DIR)/linux/rpi-4.4.y.part* | tar zxf -  -C $(BUILD_DIR)
	@make mrproper -C $(BUILD_DIR)/linux-rpi-4.4.y
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) headers_check -C $(BUILD_DIR)/linux-rpi-4.4.y
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) CROSS_COMPILE="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-" $(CONFIG_LINUX_KERNEL_DEFCONFIG)_defconfig -C $(BUILD_DIR)/linux-rpi-4.4.y
	@sed -i -e "/\\<CONFIG_KERNEL_GZIP\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo 'CONFIG_KERNEL_GZIP=y' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@sed -i -e "/\\<CONFIG_KERNEL_XZ\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo '# CONFIG_KERNEL_XZ is not set' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@sed -i -e "/\\<CONFIG_CPU_LITTLE_ENDIAN\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo 'CONFIG_CPU_LITTLE_ENDIAN=y' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@sed -i -e "/\\<CONFIG_AEABI\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo 'CONFIG_AEABI=y' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@sed -i -e "/\\<CONFIG_DEVTMPFS\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo 'CONFIG_DEVTMPFS=y' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@sed -i -e "/\\<CONFIG_DEVTMPFS_MOUNT\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo 'CONFIG_DEVTMPFS_MOUNT=y' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@sed -i -e "/\\<CONFIG_INOTIFY_USER\\>/d" $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@echo 'CONFIG_INOTIFY_USER=y' >> $(BUILD_DIR)/linux-rpi-4.4.y/.config
	@make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) CROSS_COMPILE="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-" zImage modules -C $(BUILD_DIR)/linux-rpi-4.4.y
	@for dtb in $(CONFIG_LINUX_KERNEL_INTREE_DTS_NAME) ; do \
		make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) CROSS_COMPILE="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-" $${dtb}.dtb -C $(BUILD_DIR)/linux-rpi-4.4.y ; \
	done
	@if grep -q "CONFIG_MODULES=y" $(BUILD_DIR)/linux-rpi-4.4.y/.config; then \
		make -j1 ARCH=$(CONFIG_MODE) CROSS_COMPILE="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-" INSTALL_MOD_PATH=$(ROOTFS_DIR) INSTALL_MOD_STRIP=1 -C $(BUILD_DIR)/linux-rpi-4.4.y modules_install ; \
		rm -f $(ROOTFS_DIR)/lib/modules/`make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) CROSS_COMPILE="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-" INSTALL_MOD_PATH=$(ROOTFS_DIR) INSTALL_MOD_STRIP=1 -C $(BUILD_DIR)/linux-rpi-4.4.y --no-print-directory -s kernelrelease 2>/dev/null`/build ; \
		rm -f $(ROOTFS_DIR)/lib/modules/`make -j$(CONFIG_PARALLEL_JOBS) ARCH=$(CONFIG_MODE) CROSS_COMPILE="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-" INSTALL_MOD_PATH=$(ROOTFS_DIR) INSTALL_MOD_STRIP=1 -C $(BUILD_DIR)/linux-rpi-4.4.y --no-print-directory -s kernelrelease 2>/dev/null`/source ; \
	fi
	@if grep -q "CONFIG_DTC=y" $(BUILD_DIR)/linux-rpi-4.4.y/.config; then 	\
		install -Dv -m 0755 $(BUILD_DIR)/linux-rpi-4.4.y/scripts/dtc/dtc $(TOOLS_DIR)/usr/bin/linux-dtc ;	\
		if [ ! -e $(TOOLS_DIR)/usr/bin/dtc ]; then	\
			ln -sf linux-dtc $(TOOLS_DIR)/usr/bin/dtc ;	\
		fi	\
	fi
	@install -m 0644 -Dv $(BUILD_DIR)/linux-rpi-4.4.y/arch/arm/boot/zImage $(KERNEL_DIR)/zImage
	@for dtb in $(CONFIG_LINUX_KERNEL_INTREE_DTS_NAME) ; do \
		cp -v $(BUILD_DIR)/linux-rpi-4.4.y/arch/arm/boot/dts/$${dtb}.dtb $(KERNEL_DIR) ; \
	done
	@rm -rf $(BUILD_DIR)/linux-rpi-4.4.y
