include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xz
SOURCE := $(PACKAGES_DIR)/$(NAME)/xz-5.2.3.tar.xz

staging:
	@$(STEP) "Xz 5.2.3"
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
	@( cd $(BUILD_DIR)/xz-5.2.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xz-5.2.3
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/xz-5.2.3
	@rm -rf $(BUILD_DIR)/xz-5.2.3
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Xz 5.2.3"
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
	@( cd $(BUILD_DIR)/xz-5.2.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/xz-5.2.3 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xz-5.2.3
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/xz-5.2.3
	@mv -v $(ROOTFS_DIR)/usr/bin/lzma $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/unlzma $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/lzcat $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/xz $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/unxz $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/xzcat $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/lib/liblzma.so.* $(ROOTFS_DIR)/lib
	@ln -svf ../../lib/`readlink $(ROOTFS_DIR)/usr/lib/liblzma.so` $(ROOTFS_DIR)/usr/lib/liblzma.so
	@rm -rf $(BUILD_DIR)/xz-5.2.3
	@echo $(NAME) >> $(LOG_DIR)/system.packages
