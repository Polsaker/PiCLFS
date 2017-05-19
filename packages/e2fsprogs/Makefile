include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := e2fsprogs
SOURCE := $(PACKAGES_DIR)/$(NAME)/e2fsprogs-1.43.4.tar.gz
TARGET_DEPENDENCIES := util-linux

system:
	@$(STEP) "E2fsprogs 1.43.4"
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
	@( cd $(BUILD_DIR)/e2fsprogs-1.43.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--bindir=/bin \
	--with-root-prefix="" \
	--enable-elf-shlibs \
	--disable-libblkid \
	--disable-libuuid \
	--disable-uuidd \
	--disable-fsck )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/e2fsprogs-1.43.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/e2fsprogs-1.43.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install-libs -C $(BUILD_DIR)/e2fsprogs-1.43.4
	@chmod -v u+w $(ROOTFS_DIR)/usr/lib/libcom_err.a
	@chmod -v u+w $(ROOTFS_DIR)/usr/lib/libe2p.a
	@chmod -v u+w $(ROOTFS_DIR)/usr/lib/libext2fs.a
	@chmod -v u+w $(ROOTFS_DIR)/usr/lib/libss.a
	@rm -rf $(BUILD_DIR)/e2fsprogs-1.43.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
