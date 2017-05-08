include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := gettext
SOURCE := $(PACKAGES_DIR)/$(NAME)/gettext-0.19.8.1.tar.xz
HOST_DEPENDENCIES := libxml2

toolchain:
	@$(STEP) "Gettext 0.19.8.1"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@sed -i -e '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/examples$$//' $(BUILD_DIR)/gettext-0.19.8.1/gettext-tools/Makefile.in
	@sed -i -e '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests$$//' $(BUILD_DIR)/gettext-0.19.8.1/gettext-tools/Makefile.in
	@( cd $(BUILD_DIR)/gettext-0.19.8.1/gettext-tools && \
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
	--disable-static \
	--disable-libasprintf \
	--disable-acl \
	--disable-openmp \
	--disable-rpath \
	--disable-java \
	--disable-native-java \
	--disable-csharp \
	--disable-relocatable \
	--without-emacs )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gettext-0.19.8.1/gettext-tools
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gettext-0.19.8.1/gettext-tools
	@rm -rf $(BUILD_DIR)/gettext-0.19.8.1/gettext-tools
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
