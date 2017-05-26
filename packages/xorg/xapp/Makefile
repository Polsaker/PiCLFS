include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xapp
SOURCE := iceauth-1.0.7 luit-1.1.1 mkfontdir-1.0.7 mkfontscale-1.1.2 sessreg-1.1.1 setxkbmap-1.3.1 smproxy-1.0.6 x11perf-1.6.0 xauth-1.0.10 xbacklight-1.2.1 xcmsdb-1.0.5 xcursorgen-1.0.6 xdpyinfo-1.3.2 xdriinfo-1.0.5 xev-1.2.2 xgamma-1.0.6 xhost-1.0.7 xinput-1.6.2 xkbcomp-1.4.0 xkbevd-1.1.4 xkbutils-1.0.4 xkill-1.0.4 xlsatoms-1.1.2 xlsclients-1.1.3 xmessage-1.0.4 xmodmap-1.0.9 xpr-1.0.4 xprop-1.2.2 xrandr-1.5.0 xrdb-1.1.0 xrefresh-1.0.5 xset-1.2.3 xsetroot-1.1.1 xvinfo-1.1.3 xwd-1.0.6 xwininfo-1.1.3 xwud-1.0.4
TARGET_DEPENDENCIES := libpng mesa xbitmaps xcb-util

staging:
	@$(STEP) "Xorg Applications"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@for xapp in $(SOURCE) ; do \
		$(EXTRACT) $(PACKAGES_DIR)/xorg/xapp/$${xapp}.tar.bz2 $(BUILD_DIR) ; \
		case $${xapp} in \
			luit-[0-9]* ) \
				sed -i -e "/D_XOPEN/s/5/6/" $(BUILD_DIR)/$${xapp}/configure ; \
				( cd $(BUILD_DIR)/$${xapp} && \
				./configure \
				--target=$(CONFIG_TARGET) \
				--host=$(CONFIG_TARGET) \
				--build=$(CONFIG_HOST) \
				--prefix=$(SYSROOT_DIR)/usr \
				--sysconfdir=/etc \
				--localstatedir=/var \
				--disable-static \
				--enable-malloc0returnsnull ) || exit 1; \
				;; \
			* ) \
				( cd $(BUILD_DIR)/$${xapp} && \
				./configure \
				--target=$(CONFIG_TARGET) \
				--host=$(CONFIG_TARGET) \
				--build=$(CONFIG_HOST) \
				--prefix=$(SYSROOT_DIR)/usr \
				--sysconfdir=/etc \
				--localstatedir=/var \
				--disable-static \
				--enable-malloc0returnsnull ) || exit 1; \
			;; \
		esac ; \
		make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/$${xapp} || exit 1; \
		make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/$${xapp} || exit 1; \
		rm -rf $(BUILD_DIR)/$${xapp} ; \
	done
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Xorg Applications"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@for xapp in $(SOURCE) ; do \
		$(EXTRACT) $(PACKAGES_DIR)/xorg/xapp/$${xapp}.tar.bz2 $(BUILD_DIR) ; \
		case $${xapp} in \
			luit-[0-9]* ) \
				sed -i -e "/D_XOPEN/s/5/6/" $(BUILD_DIR)/$${xapp}/configure ; \
				( cd $(BUILD_DIR)/$${xapp} && \
				./configure \
				--target=$(CONFIG_TARGET) \
				--host=$(CONFIG_TARGET) \
				--build=$(CONFIG_HOST) \
				--prefix=/usr \
				--sysconfdir=/etc \
				--localstatedir=/var \
				--disable-static \
				--enable-malloc0returnsnull ) || exit 1; \
				;; \
			* ) \
				( cd $(BUILD_DIR)/$${xapp} && \
				./configure \
				--target=$(CONFIG_TARGET) \
				--host=$(CONFIG_TARGET) \
				--build=$(CONFIG_HOST) \
				--prefix=/usr \
				--sysconfdir=/etc \
				--localstatedir=/var \
				--disable-static \
				--enable-malloc0returnsnull ) || exit 1; \
			;; \
		esac ; \
		make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/$${xapp} || exit 1; \
		make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/$${xapp} || exit 1; \
		rm -rf $(BUILD_DIR)/$${xapp} ; \
	done
	@echo $(NAME) >> $(LOG_DIR)/system.packages
