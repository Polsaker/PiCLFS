include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := eudev
SOURCE := $(PACKAGES_DIR)/$(NAME)/eudev-3.2.1.tar.gz

staging:
	@$(STEP) "Eudev 3.2.1"
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
	@( cd $(BUILD_DIR)/eudev-3.2.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/eudev-3.2.1
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/eudev-3.2.1
	@rm -rf $(BUILD_DIR)/eudev-3.2.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages


system:
	@$(STEP) "Eudev 3.2.1"
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
	@( cd $(BUILD_DIR)/eudev-3.2.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--bindir=/sbin \
	--sbindir=/sbin \
	--libdir=/usr/lib \
	--sysconfdir=/etc \
	--libexecdir=/lib \
	--with-rootprefix= \
	--with-rootlibdir=/lib \
	--enable-manpages \
	--disable-static \
	--config-cache )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/eudev-3.2.1
	@mkdir -pv $(ROOTFS_DIR)/lib/udev/rules.d
	@mkdir -pv $(ROOTFS_DIR)/etc/udev/rules.d
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/eudev-3.2.1
	@tar -jxf $(PACKAGES_DIR)/$(NAME)/udev-lfs-20140408.tar.bz2 -C $(BUILD_DIR)/eudev-3.2.1
	@( cd $(BUILD_DIR)/eudev-3.2.1 && make -f udev-lfs-20140408/Makefile.lfs DESTDIR=$(ROOTFS_DIR) install )
	@rm -rf $(BUILD_DIR)/eudev-3.2.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
