include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := procps-ng
SOURCE := $(PACKAGES_DIR)/$(NAME)/procps-ng-3.3.12.tar.xz

system:
	@$(STEP) "Procps-ng 3.3.12"
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
	@( cd $(BUILD_DIR)/procps-ng-3.3.12 && \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_realloc_0_nonnull=yes \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--exec-prefix= \
	--libdir=/usr/lib \
	--docdir=/usr/share/doc/procps-ng-3.3.12 \
	--disable-static \
	--disable-kill )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/procps-ng-3.3.12
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/procps-ng-3.3.12
	@mv -v $(ROOTFS_DIR)/usr/lib/libprocps.so.* $(ROOTFS_DIR)/lib
	@ln -sfv ../../lib/`readlink $(ROOTFS_DIR)/usr/lib/libprocps.so` $(ROOTFS_DIR)/usr/lib/libprocps.so
	@rm -rf $(BUILD_DIR)/procps-ng-3.3.12
	@echo $(NAME) >> $(LOG_DIR)/system.packages
