include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := inetutils
SOURCE := $(PACKAGES_DIR)/$(NAME)/inetutils-1.9.4.tar.xz

system:
	@$(STEP) "Inetutils 1.9.4"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/inetutils-1.9-PATH_PROCNET_DEV.patch -d $(BUILD_DIR)/inetutils-1.9.4
	@( cd $(BUILD_DIR)/inetutils-1.9.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--localstatedir=/var \
	--disable-logger \
	--disable-whois \
	--disable-rcp \
	--disable-rexec \
	--disable-rlogin \
	--disable-rsh \
	--disable-servers )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/inetutils-1.9.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/inetutils-1.9.4
	@mv -v $(ROOTFS_DIR)/usr/bin/hostname $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/ping $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/ping6 $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/traceroute $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/ifconfig $(ROOTFS_DIR)/sbin
	@chmod -v 0755 $(ROOTFS_DIR)/bin/hostname
	@chmod -v 0755 $(ROOTFS_DIR)/bin/ping
	@chmod -v 0755 $(ROOTFS_DIR)/bin/ping6
	@chmod -v 0755 $(ROOTFS_DIR)/bin/traceroute
	@chmod -v 0755 $(ROOTFS_DIR)/sbin/ifconfig
	@rm -rf $(BUILD_DIR)/inetutils-1.9.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
