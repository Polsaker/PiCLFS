include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := gcc
TARGET_DEPENDENCIES := gmp mpfr mpc zlib

staging-libs:
	@$(STEP) "Copy libgcc, libatomic, libstdc"
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libgcc_s* $(SYSROOT_DIR)/lib/
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libatomic* $(SYSROOT_DIR)/lib/
	@for i in libstdc++ ; do \
		cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/$${i}.a $(SYSROOT_DIR)/usr/lib/ ; \
		cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/$${i}.so* $(SYSROOT_DIR)/usr/lib/ ; \
	done
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system-libs:
	@$(STEP) "Copy libgcc, libatomic, libstdc"
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libgcc_s* $(ROOTFS_DIR)/lib/
	@cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/libatomic* $(ROOTFS_DIR)/lib/
	@for i in libstdc++ ; do \
		cp -dpvf $(TOOLS_DIR)/usr/$(CONFIG_TARGET)/lib*/$${i}.so* $(ROOTFS_DIR)/usr/lib/ ; \
	done
	@echo $(NAME) >> $(LOG_DIR)/system.packages

staging:
	@$(STEP) "GCC 6.3.0"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(PACKAGES_DIR)/gcc/gcc-6.3.0.part* | tar jxf -  -C $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/gcc-6.3.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-decimal-float \
	--with-abi="$(CONFIG_ABI)" \
	--with-cpu=$(CONFIG_CPU) \
	--with-fpu=$(CONFIG_FPU) \
	--with-float=$(CONFIG_FLOAT) \
	--with-mode=$(CONFIG_MODE) \
	--enable-languages=c,c++ \
	--disable-multilib \
	--disable-bootstrap \
	--with-system-zlib )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gcc-6.3.0
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gcc-6.3.0
	@rm -rf $(BUILD_DIR)/gcc-6.3.0
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "GCC 6.3.0"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(PACKAGES_DIR)/gcc/gcc-6.3.0.part* | tar jxf -  -C $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/gcc-6.3.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-decimal-float \
	--with-abi="$(CONFIG_ABI)" \
	--with-cpu=$(CONFIG_CPU) \
	--with-fpu=$(CONFIG_FPU) \
	--with-float=$(CONFIG_FLOAT) \
	--with-mode=$(CONFIG_MODE) \
	--enable-languages=c,c++ \
	--disable-multilib \
	--disable-bootstrap \
	--with-system-zlib )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gcc-6.3.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/gcc-6.3.0
	@ln -svf ../usr/bin/cpp $(ROOTFS_DIR)/lib
	@ln -svf gcc $(ROOTFS_DIR)/usr/bin/cc
	@mkdir -pv $(ROOTFS_DIR)/usr/share/gdb/auto-load/usr/lib
	@mv -v $(ROOTFS_DIR)/usr/lib/*gdb.py $(ROOTFS_DIR)/usr/share/gdb/auto-load/usr/lib
	@rm -rf $(BUILD_DIR)/gcc-6.3.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
