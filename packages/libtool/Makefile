include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libtool
SOURCE := $(PACKAGES_DIR)/$(NAME)/libtool-2.4.6.tar.xz
HOST_DEPENDENCIES := m4

toolchain:
	@$(STEP) "Libtool 2.4.6"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@find $(BUILD_DIR)/libtool-2.4.6 -name aclocal.m4 -exec touch '{}' \;
	@find $(BUILD_DIR)/libtool-2.4.6 -name config-h.in -exec touch '{}' \;
	@find $(BUILD_DIR)/libtool-2.4.6 -name configure -exec touch '{}' \;
	@find $(BUILD_DIR)/libtool-2.4.6 -name Makefile.in -exec touch '{}' \;
	@( cd $(BUILD_DIR)/libtool-2.4.6 && \
	CFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	CPPFLAGS="-I$(TOOLS_DIR)/usr/include" \
	CXXFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
	PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" \
	PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="/" \
	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
	MAKEINFO=true \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--disable-static )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/libtool-2.4.6
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/libtool-2.4.6
	@rm -rf $(BUILD_DIR)/libtool-2.4.6
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
