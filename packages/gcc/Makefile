staging:
	@$(STEP) "Copy libgcc, libatomic, libstdc"
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libgcc_s* $(SYSROOT_DIR)/lib/
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libatomic* $(SYSROOT_DIR)/lib/
	@for i in libstdc++ ; do \
		cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/$${i}.a $(SYSROOT_DIR)/usr/lib/ ; \
		cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/$${i}.so* $(SYSROOT_DIR)/usr/lib/ ; \
	done

system:
	@$(STEP) "Copy libgcc, libatomic, libstdc"
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libgcc_s* $(ROOTFS_DIR)/lib/
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libatomic* $(ROOTFS_DIR)/lib/
	@for i in libstdc++ ; do \
		cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/$${i}.so* $(ROOTFS_DIR)/usr/lib/ ; \
	done
