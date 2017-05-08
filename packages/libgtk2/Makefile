include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libgtk2
SOURCE := $(PACKAGES_DIR)/$(NAME)/gtk+-2.24.30.tar.xz
HOST_DEPENDENCIES := gdk-pixbuf
TARGET_DEPENDENCIES := atk gdk-pixbuf

toolchain:
	@$(STEP) "GTK+ 2.24.30"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@patch -Np1 -i $(PACKAGES_DIR)/libgtk2/libgtk2-reduce-dependencies.patch -d $(BUILD_DIR)/gtk+-2.24.30
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && aclocal )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && autoheader )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && autoconf )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && \
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
	--disable-glibtest \
	--without-libtiff \
	--without-libjpeg \
	--with-gdktarget=none \
	--disable-cups )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gtk+-2.24.30/gtk gtk-update-icon-cache
	@cp -v $(BUILD_DIR)/gtk+-2.24.30/gtk/gtk-update-icon-cache $(TOOLS_DIR)/usr/bin
	@rm -rf $(BUILD_DIR)/gtk+-2.24.30
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "GTK+ 2.24.30"
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
	@patch -Np1 -i $(PACKAGES_DIR)/libgtk2/libgtk2-reduce-dependencies.patch -d $(BUILD_DIR)/gtk+-2.24.30
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && aclocal )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && autoheader )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && autoconf )
	@sed -i -e 's#modules demos tests#modules#g' $(BUILD_DIR)/gtk+-2.24.30/Makefile.in
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && \
	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(TOOLS_DIR)/usr/bin/gtk-update-icon-cache \
	ac_cv_path_GDK_PIXBUF_CSOURCE=$(TOOLS_DIR)/usr/bin/gdk-pixbuf-csource \
	DB2HTML=false \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--disable-static \
	--enable-shared \
	--disable-glibtest \
	--enable-explicit-deps=no \
	--with-x \
	--x-includes=$(SYSROOT_DIR)/usr/include/X11 \
	--x-libraries=$(SYSROOT_DIR)/usr/lib \
	--with-gdktarget=x11 \
	--disable-xinerama \
	--with-xinput=no \
	--without-libjpeg \
	--without-libtiff \
	--disable-cups )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gtk+-2.24.30
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gtk+-2.24.30
	@rm -rf $(BUILD_DIR)/gtk+-2.24.30
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "GTK+ 2.24.30"
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
	@patch -Np1 -i $(PACKAGES_DIR)/libgtk2/libgtk2-reduce-dependencies.patch -d $(BUILD_DIR)/gtk+-2.24.30
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && aclocal )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && autoheader )
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && autoconf )
	@sed -i -e 's#modules demos tests#modules#g' $(BUILD_DIR)/gtk+-2.24.30/Makefile.in
	@( cd $(BUILD_DIR)/gtk+-2.24.30 && \
	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(TOOLS_DIR)/usr/bin/gtk-update-icon-cache \
	ac_cv_path_GDK_PIXBUF_CSOURCE=$(TOOLS_DIR)/usr/bin/gdk-pixbuf-csource \
	DB2HTML=false \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--sysconfdir=/etc \
	--disable-static \
	--enable-shared \
	--disable-glibtest \
	--enable-explicit-deps=no \
	--with-x \
	--x-includes=$(SYSROOT_DIR)/usr/include/X11 \
	--x-libraries=$(SYSROOT_DIR)/usr/lib \
	--with-gdktarget=x11 \
	--disable-xinerama \
	--with-xinput=no \
	--without-libjpeg \
	--without-libtiff \
	--disable-cups )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gtk+-2.24.30
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/gtk+-2.24.30
	@echo "include \"/usr/share/themes/Clearlooks/gtk-2.0/gtkrc\"" > $(ROOTFS_DIR)/etc/gtk-2.0/gtkrc
	@echo "gtk-icon-theme-name = \"elementary\"" >> $(ROOTFS_DIR)/etc/gtk-2.0/gtkrc
	@rm -rf $(BUILD_DIR)/gtk+-2.24.30
	@echo $(NAME) >> $(LOG_DIR)/system.packages
