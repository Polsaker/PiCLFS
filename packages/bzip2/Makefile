include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := bzip2
SOURCE := $(PACKAGES_DIR)/$(NAME)/bzip2-1.0.6.tar.gz

system:
	@$(STEP) "Bzip2 1.0.6"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/bzip2-1.0.6-install_docs-1.patch -d $(BUILD_DIR)/bzip2-1.0.6
	@sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' $(BUILD_DIR)/bzip2-1.0.6/Makefile
	@sed -i "s@(PREFIX)/share/man@(PREFIX)/share/man@g" $(BUILD_DIR)/bzip2-1.0.6/Makefile
	@sed -i "s@bzip2recover test@bzip2recover@g" $(BUILD_DIR)/bzip2-1.0.6/Makefile
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib -C $(BUILD_DIR)/bzip2-1.0.6 -f Makefile-libbz2_so
	@make clean -C $(BUILD_DIR)/bzip2-1.0.6
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib -C $(BUILD_DIR)/bzip2-1.0.6
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib PREFIX=$(ROOTFS_DIR)/usr install -C $(BUILD_DIR)/bzip2-1.0.6
	@cp -v $(BUILD_DIR)/bzip2-1.0.6/bzip2-shared $(ROOTFS_DIR)/bin/bzip2
	@cp -av $(BUILD_DIR)/bzip2-1.0.6/libbz2.so* $(ROOTFS_DIR)/lib
	@ln -sv ../../lib/libbz2.so.1.0 $(ROOTFS_DIR)/usr/lib/libbz2.so
	@rm -v $(ROOTFS_DIR)/usr/bin/bunzip2
	@rm -v $(ROOTFS_DIR)/usr/bin/bzcat
	@rm -v $(ROOTFS_DIR)/usr/bin/bzip2
	@ln -sv bzip2 $(ROOTFS_DIR)/bin/bunzip2
	@ln -sv bzip2 $(ROOTFS_DIR)/bin/bzcat
	@rm -rf $(BUILD_DIR)/bzip2-1.0.6
	@echo $(NAME) >> $(LOG_DIR)/system.packages
