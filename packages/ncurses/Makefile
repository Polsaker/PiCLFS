SOURCE := $(PACKAGES_DIR)/ncurses/ncurses-6.0.tar.gz

toolchain:
	@$(STEP) "Ncurses 6.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/ncurses-6.0 && \
	AWK=gawk ./configure --prefix=$(TOOLS_DIR)/usr --without-debug )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/ncurses-6.0/include
	@make -j$(CONFIG_PARALLEL_JOBS) tic -C $(BUILD_DIR)/ncurses-6.0/progs
	@install -v -m755 $(BUILD_DIR)/ncurses-6.0/progs/tic $(TOOLS_DIR)/usr/bin
	@rm -rf $(BUILD_DIR)/ncurses-6.0

staging:
	@$(STEP) "Ncurses 6.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@sed -i '/LIBTOOL_INSTALL/d' $(BUILD_DIR)/ncurses-6.0/c++/Makefile.in
	@( cd $(BUILD_DIR)/ncurses-6.0 && \
	CPPFLAGS="-P" \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--with-shared \
	--without-debug \
	--without-normal \
	--enable-pc-files \
	--enable-widec )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/ncurses-6.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(SYSROOT_DIR) PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig install -C $(BUILD_DIR)/ncurses-6.0
	@for lib in ncurses form panel menu ; do \
		rm -vf                    $(SYSROOT_DIR)/usr/lib/lib$${lib}.so ; \
		echo "INPUT(-l$${lib}w)" > $(SYSROOT_DIR)/usr/lib/lib$${lib}.so ; \
		ln -sfv $${lib}w.pc        $(SYSROOT_DIR)/usr/lib/pkgconfig/$${lib}.pc ; \
	done
	rm -vf                     $(SYSROOT_DIR)/usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" > $(SYSROOT_DIR)/usr/lib/libcursesw.so
	ln -sfv libncurses.so      $(SYSROOT_DIR)/usr/lib/libcurses.so
	@rm -rf $(BUILD_DIR)/ncurses-6.0

system:
	@$(STEP) "Ncurses 6.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@sed -i '/LIBTOOL_INSTALL/d' $(BUILD_DIR)/ncurses-6.0/c++/Makefile.in
	@( cd $(BUILD_DIR)/ncurses-6.0 && \
	CPPFLAGS="-P" \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--with-shared \
	--without-debug \
	--without-normal \
	--enable-pc-files \
	--enable-widec )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/ncurses-6.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig install -C $(BUILD_DIR)/ncurses-6.0
	@for lib in ncurses form panel menu ; do \
		rm -vf                    $(ROOTFS_DIR)/usr/lib/lib$${lib}.so ; \
		echo "INPUT(-l$${lib}w)" > $(ROOTFS_DIR)/usr/lib/lib$${lib}.so ; \
		ln -sfv $${lib}w.pc        $(ROOTFS_DIR)/usr/lib/pkgconfig/$${lib}.pc ; \
	done
	rm -vf                     $(ROOTFS_DIR)/usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" > $(ROOTFS_DIR)/usr/lib/libcursesw.so
	ln -sfv libncurses.so      $(ROOTFS_DIR)/usr/lib/libcurses.so
	@rm -rf $(BUILD_DIR)/ncurses-6.0
