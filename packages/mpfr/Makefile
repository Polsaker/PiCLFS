SOURCE := $(PACKAGES_DIR)/mpfr/mpfr-3.1.5.tar.xz

toolchain:
	@$(STEP) "MPFR 3.1.5"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/mpfr-3.1.5 && \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--disable-static \
	--with-gmp=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mpfr-3.1.5
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/mpfr-3.1.5
	@rm -rf $(BUILD_DIR)/mpfr-3.1.5
