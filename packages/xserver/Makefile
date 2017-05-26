include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xserver
SOURCE := $(PACKAGES_DIR)/$(NAME)/xorg-server-1.19.3.tar.bz2
TARGET_DEPENDENCIES := libdrm openssl pixman xfonts xkeyboard-config libepoxy

staging:
	@$(STEP) "Xorg Server 1.19.3"
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
	@sed -i '/chown root/d' $(BUILD_DIR)/xorg-server-1.19.3/hw/xfree86/Makefile.in
	@sed -i '/chown root/d' $(BUILD_DIR)/xorg-server-1.19.3/hw/xfree86/Makefile.am
	@( cd $(BUILD_DIR)/xorg-server-1.19.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--localstatedir=$(SYSROOT_DIR)/var \
	--disable-static \
	--enable-malloc0returnsnull \
	--enable-glamor \
	--enable-install-setuid \
	--enable-suid-wrapper \
	--disable-systemd-logind \
	--with-xkb-output=$(SYSROOT_DIR)/var/lib/xkb )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xorg-server-1.19.3
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/xorg-server-1.19.3
	@rm -rf $(BUILD_DIR)/xorg-server-1.19.3
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Xorg Server 1.19.3"
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
	@sed -i '/chown root/d' $(BUILD_DIR)/xorg-server-1.19.3/hw/xfree86/Makefile.in
	@sed -i '/chown root/d' $(BUILD_DIR)/xorg-server-1.19.3/hw/xfree86/Makefile.am
	@( cd $(BUILD_DIR)/xorg-server-1.19.3 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-malloc0returnsnull \
	--enable-glamor \
	--enable-install-setuid \
	--enable-suid-wrapper \
	--disable-systemd-logind \
	--with-xkb-output=/var/lib/xkb )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xorg-server-1.19.3
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/xorg-server-1.19.3
	@mkdir -pv $(ROOTFS_DIR)/etc/X11/xorg.conf.d
	@cp -v $(PACKAGES_DIR)/$(NAME)/createfiles $(ROOTFS_DIR)/etc/sysconfig/createfiles
	@rm -rf $(BUILD_DIR)/xorg-server-1.19.3
	@echo $(NAME) >> $(LOG_DIR)/system.packages
