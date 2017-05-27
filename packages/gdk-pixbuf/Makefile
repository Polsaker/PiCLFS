include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := gdk-pixbuf
SOURCE := $(PACKAGES_DIR)/$(NAME)/gdk-pixbuf-2.36.6.tar.xz
HOST_DEPENDENCIES := glib libjpeg-turbo libpng
TARGET_DEPENDENCIES := glib libjpeg-turbo libpng

toolchain:
	@$(STEP) "gdk-pixbuf 2.36.6"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/gdk-pixbuf-2.36.6 && \
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
	--without-libjpeg \
	--without-libtiff )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@rm -rf $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "gdk-pixbuf 2.36.6"
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
	@cp -f $(TOOLS_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache $(BUILD_DIR)/gdk-pixbuf-2.36.6/gdk-pixbuf
	@sed -i -e 's/ tests//' $(BUILD_DIR)/gdk-pixbuf-2.36.6/Makefile.in
	@( cd $(BUILD_DIR)/gdk-pixbuf-2.36.6 && \
	ac_cv_path_GLIB_GENMARSHAL=$(TOOLS_DIR)/usr/bin/glib-genmarshal \
	gio_can_sniff=no \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--disable-glibtest \
	--without-libtiff \
	--with-x11 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@rm -rf $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "gdk-pixbuf 2.36.6"
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
	@cp -f $(TOOLS_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache $(BUILD_DIR)/gdk-pixbuf-2.36.6/gdk-pixbuf
	@sed -i -e 's/ tests//' $(BUILD_DIR)/gdk-pixbuf-2.36.6/Makefile.in
	@( cd $(BUILD_DIR)/gdk-pixbuf-2.36.6 && \
	ac_cv_path_GLIB_GENMARSHAL=$(TOOLS_DIR)/usr/bin/glib-genmarshal \
	gio_can_sniff=no \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--disable-glibtest \
	--without-libtiff \
	--with-x11 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@rm -rf $(BUILD_DIR)/gdk-pixbuf-2.36.6
	@echo $(NAME) >> $(LOG_DIR)/system.packages
