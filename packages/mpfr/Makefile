include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := mpfr
SOURCE := $(PACKAGES_DIR)/$(NAME)/mpfr-3.1.5.tar.xz
HOST_DEPENDENCIES := gmp
TARGET_DEPENDENCIES := gmp

toolchain:
	@$(STEP) "MPFR 3.1.5"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
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
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "MPFR 3.1.5"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/mpfr-3.1.5 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--enable-thread-safe \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mpfr-3.1.5
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/mpfr-3.1.5
	@rm -rf $(BUILD_DIR)/mpfr-3.1.5
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "MPFR 3.1.5"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/mpfr-3.1.5 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--enable-thread-safe \
	--disable-static \
	--docdir=/usr/share/doc/mpfr-3.1.5 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mpfr-3.1.5
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/mpfr-3.1.5
	@rm -rf $(BUILD_DIR)/mpfr-3.1.5
	@echo $(NAME) >> $(LOG_DIR)/system.packages
