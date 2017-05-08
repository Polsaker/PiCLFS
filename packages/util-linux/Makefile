include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := util-linux
SOURCE := $(PACKAGES_DIR)/$(NAME)/util-linux-2.28.2.tar.xz
HOST_DEPENDENCIES := pkgconf

toolchain:
	@$(STEP) "Util-linux 2.28.2"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/util-linux-2.28.2 && \
	CFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	CPPFLAGS="-I$(TOOLS_DIR)/usr/include" \
	CXXFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
	PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" \
	PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="/" \
	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--enable-shared \
	--disable-static \
	--without-python \
	--enable-libblkid \
	--enable-libmount \
	--enable-libuuid \
	--without-ncurses \
	--without-tinfo \
	--disable-all-programs )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/util-linux-2.28.2
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install MKINSTALLDIRS=$(BUILD_DIR)/util-linux-2.28.2/config/mkinstalldirs -C $(BUILD_DIR)/util-linux-2.28.2
	@rm -rf $(BUILD_DIR)/util-linux-2.28.2
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "Util-linux 2.28.2"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/util-linux-2.28.2 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--enable-shared \
	--disable-rpath \
	--disable-makeinstall-chown \
	--without-systemd \
	--with-systemdsystemunitdir=no \
	--without-ncurses \
	--disable-all-programs \
	--disable-agetty \
	--disable-bfs \
	--disable-cal \
	--disable-chfn-chsh \
	--disable-cramfs \
	--disable-eject \
	--disable-fallocate \
	--disable-fdformat \
	--disable-fsck \
	--disable-hwclock \
	--disable-ipcrm \
	--disable-ipcs \
	--disable-kill \
	--disable-last \
	--enable-libblkid \
	--disable-libfdisk \
	--enable-libmount \
	--disable-libsmartcols \
	--enable-libuuid \
	--disable-line \
	--disable-logger \
	--disable-last \
	--disable-login \
	--disable-runuser \
	--disable-su \
	--disable-sulogin \
	--disable-losetup \
	--disable-lslogins \
	--disable-mesg \
	--disable-minix \
	--disable-more \
	--disable-mount \
	--disable-mountpoint \
	--disable-newgrp \
	--disable-nologin \
	--disable-nsenter \
	--disable-partx \
	--disable-pg \
	--disable-pivot_root \
	--disable-raw \
	--disable-rename \
	--disable-reset \
	--disable-schedutils \
	--disable-setpriv \
	--disable-setterm \
	--disable-switch_root \
	--disable-tunelp \
	--disable-ul \
	--disable-unshare \
	--disable-utmpdump \
	--disable-uuidd \
	--disable-vipw \
	--disable-wall \
	--disable-wdctl \
	--disable-write \
	--disable-zramctl \
	--without-python \
	--without-readline \
	--without-audit )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/util-linux-2.28.2
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/util-linux-2.28.2
	@rm -rf $(BUILD_DIR)/util-linux-2.28.2
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Util-linux 2.28.2"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/util-linux-2.28.2 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-static \
	--enable-shared \
	--disable-rpath \
	--disable-makeinstall-chown \
	--without-systemd \
	--with-systemdsystemunitdir=no \
	--without-ncurses \
	--disable-all-programs \
	--disable-agetty \
	--disable-bfs \
	--disable-cal \
	--disable-chfn-chsh \
	--disable-cramfs \
	--disable-eject \
	--disable-fallocate \
	--disable-fdformat \
	--disable-fsck \
	--disable-hwclock \
	--disable-ipcrm \
	--disable-ipcs \
	--disable-kill \
	--disable-last \
	--enable-libblkid \
	--disable-libfdisk \
	--enable-libmount \
	--disable-libsmartcols \
	--enable-libuuid \
	--disable-line \
	--disable-logger \
	--disable-last \
	--disable-login \
	--disable-runuser \
	--disable-su \
	--disable-sulogin \
	--disable-losetup \
	--disable-lslogins \
	--disable-mesg \
	--disable-minix \
	--disable-more \
	--disable-mount \
	--disable-mountpoint \
	--disable-newgrp \
	--disable-nologin \
	--disable-nsenter \
	--disable-partx \
	--disable-pg \
	--disable-pivot_root \
	--disable-raw \
	--disable-rename \
	--disable-reset \
	--disable-schedutils \
	--disable-setpriv \
	--disable-setterm \
	--disable-switch_root \
	--disable-tunelp \
	--disable-ul \
	--disable-unshare \
	--disable-utmpdump \
	--disable-uuidd \
	--disable-vipw \
	--disable-wall \
	--disable-wdctl \
	--disable-write \
	--disable-zramctl \
	--without-python \
	--without-readline \
	--without-audit )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/util-linux-2.28.2
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/util-linux-2.28.2
	@rm -rf $(BUILD_DIR)/util-linux-2.28.2
	@echo $(NAME) >> $(LOG_DIR)/system.packages
