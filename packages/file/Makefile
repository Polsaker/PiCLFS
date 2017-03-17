SOURCE := $(PACKAGES_DIR)/file/file-5.30.tar.gz

toolchain:
	@$(STEP) "File 5.30"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/file-5.30 && ./configure --prefix=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/file-5.30
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/file-5.30
	@rm -rf $(BUILD_DIR)/file-5.30
