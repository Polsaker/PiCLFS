NAME := gmp
SOURCE := $(PACKAGES_DIR)/$(NAME)/gmp-6.1.2.tar.xz

toolchain:
	@$(STEP) "GMP 6.1.2"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/gmp-6.1.2 && \
	./configure --prefix=$(TOOLS_DIR)/usr --disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gmp-6.1.2
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gmp-6.1.2
	@rm -rf $(BUILD_DIR)/gmp-6.1.2
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
