NAME := binutils
SOURCE := $(PACKAGES_DIR)/$(NAME)/binutils-2.28.tar.gz

toolchain:
	@$(STEP) "Binutils 2.28"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@mkdir -pv $(BUILD_DIR)/binutils-2.28/binutils-build
	@( cd $(BUILD_DIR)/binutils-2.28/binutils-build && \
	AR="ar" \
	AS="as" \
	$(BUILD_DIR)/binutils-2.28/configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--disable-multilib \
	--disable-werror \
	--target=$(CONFIG_TARGET) \
	--disable-shared \
	--enable-static \
	--with-sysroot=$(SYSROOT_DIR) \
	--enable-poison-system-directories \
	--disable-sim \
	--disable-gdb )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/binutils-2.28/binutils-build
	@rm -rf $(BUILD_DIR)/binutils-2.28
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
