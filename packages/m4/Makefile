SOURCE := $(PACKAGES_DIR)/m4/m4-1.4.18.tar.xz

toolchain:
	@$(STEP) "M4 1.4.18"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/m4-1.4.18 && ./configure --prefix=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/m4-1.4.18
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/m4-1.4.18
	@rm -rf $(BUILD_DIR)/m4-1.4.18
