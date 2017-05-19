include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := kmod
SOURCE := $(PACKAGES_DIR)/$(NAME)/kmod-24.tar.xz
TARGET_DEPENDENCIES := zlib xz

system:
	@$(STEP) "Kmod 24"
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
	@( cd $(BUILD_DIR)/kmod-24 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--bindir=/bin \
	--sysconfdir=/etc \
	--with-rootlibdir=/lib \
	--with-xz \
	--with-zlib )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/kmod-24
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/kmod-24
	@for target in depmod insmod lsmod modinfo modprobe rmmod ; do \
  	ln -svf ../bin/kmod $(ROOTFS_DIR)/sbin/$${target} ; \
	done
	@ln -svf kmod $(ROOTFS_DIR)/bin/lsmod
	@rm -rf $(BUILD_DIR)/kmod-24
	@echo $(NAME) >> $(LOG_DIR)/system.packages
