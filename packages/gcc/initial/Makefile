toolchain:
	@$(STEP) "GCC 6.3.0 - Initial"
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
	--localstatedir=$(TOOLS_DIR)/var \
	--disable-static \
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
	--enable-languages=c \
	--disable-shared \
	--without-headers \
	--disable-threads \
	--with-newlib \
	--disable-largefile \
	--disable-nls )
	@make -j$(CONFIG_PARALLEL_JOBS) gcc_cv_libc_provides_ssp=yes all-gcc all-target-libgcc -C $(BUILD_DIR)/gcc-6.3.0/gcc-build
	@make -j$(CONFIG_PARALLEL_JOBS) install-gcc install-target-libgcc -C $(BUILD_DIR)/gcc-6.3.0/gcc-build
	@rm -rf $(BUILD_DIR)/gcc-6.3.0
