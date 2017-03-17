SOURCE=$(PACKAGES_DIR)/iana-etc/iana-etc-2.30.tar.bz2

system:
	@$(STEP) "Iana-etc 2.30"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	patch -Np1 -i $(PACKAGES_DIR)/iana-etc/iana-etc-2.30-update-2.patch -d $(BUILD_DIR)/iana-etc-2.30
	@make -j$(CONFIG_PARALLEL_JOBS) get -C $(BUILD_DIR)/iana-etc-2.30
	@make -j$(CONFIG_PARALLEL_JOBS) STRIP=yes -C $(BUILD_DIR)/iana-etc-2.30
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/iana-etc-2.30
	@rm -rf $(BUILD_DIR)/iana-etc-2.30
