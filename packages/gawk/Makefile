NAME := gawk
SOURCE := $(PACKAGES_DIR)/$(NAME)/gawk-4.1.4.tar.xz

toolchain:
	@$(STEP) "Gawk 4.1.4"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/gawk-4.1.4 && ./configure --prefix=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gawk-4.1.4
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gawk-4.1.4
	@rm -rf $(BUILD_DIR)/gawk-4.1.4
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
