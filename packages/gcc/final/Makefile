include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := gcc-final
HOST_DEPENDENCIES := gmp mpfr gcc-initial
TARGET_DEPENDENCIES := glibc linux-header

toolchain:
	@$(STEP) "GCC 6.3.0 - Final"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(PACKAGES_DIR)/gcc/gcc-6.3.0.part* | tar jxf -  -C $(BUILD_DIR) --exclude='libjava/*' --exclude='libgo/*' --exclude='gcc/testsuite/*' --exclude='libstdc++-v3/testsuite/*'
	@mkdir -p $(BUILD_DIR)/gcc-6.3.0/libstdc++-v3/testsuite/
	@echo "all:" > $(BUILD_DIR)/gcc-6.3.0/libstdc++-v3/testsuite/Makefile.in
	@echo "install:" >> $(BUILD_DIR)/gcc-6.3.0/libstdc++-v3/testsuite/Makefile.in
	@mkdir -v $(BUILD_DIR)/gcc-6.3.0/gcc-build
	@( cd $(BUILD_DIR)/gcc-6.3.0/gcc-build && \
	AR="ar" \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
	$(BUILD_DIR)/gcc-6.3.0/configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--enable-static \
	--target=$(CONFIG_TARGET) \
	--with-sysroot=$(SYSROOT_DIR) \
	--disable-__cxa_atexit \
	--with-gnu-ld \
	--disable-libssp \
	--disable-multilib \
	--with-gmp=$(TOOLS_DIR)/usr \
	--with-mpc=$(TOOLS_DIR)/usr \
	--with-mpfr=$(TOOLS_DIR)/usr \
	--with-pkgversion="$(CONFIG_PKG_VERSION)" \
	--with-bugurl="$(CONFIG_BUG_URL)" \
	--disable-libquadmath \
	--enable-tls \
	--disable-libmudflap \
	--enable-threads \
	--without-isl \
	--without-cloog \
	--disable-decimal-float \
	--with-abi="$(CONFIG_ABI)" \
	--with-cpu=$(CONFIG_CPU) \
	--with-fpu=$(CONFIG_FPU) \
	--with-float=$(CONFIG_FLOAT) \
	--with-mode=$(CONFIG_MODE) \
	--enable-languages=c,c++ \
	--with-build-time-tools=$(TOOLS_DIR)/usr/$(CONFIG_TARGET)/bin \
	--enable-shared \
	--disable-libgomp )
	@make -j$(CONFIG_PARALLEL_JOBS) AS_FOR_TARGET="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as" LD_FOR_TARGET="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld" -C $(BUILD_DIR)/gcc-6.3.0/gcc-build
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gcc-6.3.0/gcc-build
	@rm -rf $(BUILD_DIR)/gcc-6.3.0
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
