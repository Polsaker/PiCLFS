include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := polkit
SOURCE := $(PACKAGES_DIR)/$(NAME)/polkit-0.103.tar.gz

staging:
	@$(STEP) "Polkit 0.103"
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
	@( cd $(BUILD_DIR)/polkit-0.103 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--localstatedir=$(SYSROOT_DIR)/var \
	--disable-static \
	--with-authfw=shadow \
	--with-os-type=unknown \
	--disable-man-pages \
	--disable-examples )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/polkit-0.103
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/polkit-0.103
	@rm -rf $(BUILD_DIR)/polkit-0.103
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Polkit 0.103"
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
	@( cd $(BUILD_DIR)/polkit-0.103 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--with-authfw=shadow \
	--with-os-type=unknown \
	--disable-man-pages \
	--disable-examples )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/polkit-0.103
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/polkit-0.103
	@echo 'polkitd:x:27:' >> $(ROOTFS_DIR)/etc/group
	@echo 'sshd:x:27:27:PolicyKit Daemon Owner:/etc/polkit-1:/bin/false' >> $(ROOTFS_DIR)/etc/passwd
	@cp -v $(PACKAGES_DIR)/$(NAME)/polkit-1 $(ROOTFS_DIR)/etc/pam.d/polkit-1
	@rm -rf $(BUILD_DIR)/polkit-0.103
	@echo $(NAME) >> $(LOG_DIR)/system.packages
