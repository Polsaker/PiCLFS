include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := python
SOURCE := $(PACKAGES_DIR)/$(NAME)/Python-2.7.3.tar.xz
HOST_DEPENDENCIES := libffi
TARGET_DEPENDENCIES := libffi

toolchain:
	@$(STEP) "Python 2.7.3"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@( cd $(BUILD_DIR)/Python-2.7.3 && \
	CFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	CPPFLAGS="-I$(TOOLS_DIR)/usr/include" \
	CXXFLAGS="-O2 -I$(TOOLS_DIR)/usr/include" \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib -Wl,--enable-new-dtags" \
	PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" \
	PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="/" \
	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
	ac_cv_prog_HAS_HG=/bin/false \
	ac_cv_prog_SVNVERSION=/bin/false \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--sysconfdir=$(TOOLS_DIR)/etc \
	--localstatedir=$(TOOLS_DIR)/var \
	--enable-static \
	--without-cxx-main \
	--disable-sqlite3 \
	--disable-tk \
	--with-expat=system \
	--disable-curses \
	--disable-codecs-cjk \
	--disable-nis \
	--enable-unicodedata \
	--disable-dbm \
	--disable-gdbm \
	--disable-bsddb \
	--disable-test-modules \
	--disable-bz2 \
	--disable-ssl \
	--disable-ossaudiodev \
	--disable-pyo-build )
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/Python-2.7.3
	@PKG_CONFIG="$(TOOLS_DIR)/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="$(TOOLS_DIR)/usr/lib/pkgconfig:$(TOOLS_DIR)/usr/share/pkgconfig" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/Python-2.7.3
	@rm -rf $(BUILD_DIR)/Python-2.7.3
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "Python 2.7.3"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/Python-2.7.3 && ./configure )
	@make -j$(CONFIG_PARALLEL_JOBS) python Parser/pgen -C $(BUILD_DIR)/Python-2.7.3
	@mv $(BUILD_DIR)/Python-2.7.3/python $(BUILD_DIR)/Python-2.7.3/hostpython
	@mv $(BUILD_DIR)/Python-2.7.3/Parser/pgen $(BUILD_DIR)/Python-2.7.3/Parser/hostpgen
	@make distclean -C $(BUILD_DIR)/Python-2.7.3
	@patch -p1 -i $(PACKAGES_DIR)/python/Python-2.7.3-xcompile.patch -d $(BUILD_DIR)/Python-2.7.3
	@( cd $(BUILD_DIR)/Python-2.7.3 && \
		CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc \
		CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++ \
		AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar \
		RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib \
		./configure \
		--host=arm-linux \
		--build=$(CONFIG_HOST) \
		--prefix=/usr )
	@make HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython HOSTPGEN=$(BUILD_DIR)/Python-2.7.3/Parser/hostpgen -C $(BUILD_DIR)/Python-2.7.3 BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes HOSTARCH=arm-linux BUILDARCH=$(CONFIG_HOST) -C $(BUILD_DIR)/Python-2.7.3
	@make install HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes prefix=$(SYSROOT_DIR)/usr -C $(BUILD_DIR)/Python-2.7.3
	@rm -rf $(BUILD_DIR)/Python-2.7.3
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Python 2.7.3"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/Python-2.7.3 && ./configure )
	@make -j$(CONFIG_PARALLEL_JOBS) python Parser/pgen -C $(BUILD_DIR)/Python-2.7.3
	@mv $(BUILD_DIR)/Python-2.7.3/python $(BUILD_DIR)/Python-2.7.3/hostpython
	@mv $(BUILD_DIR)/Python-2.7.3/Parser/pgen $(BUILD_DIR)/Python-2.7.3/Parser/hostpgen
	@make distclean -C $(BUILD_DIR)/Python-2.7.3
	@patch -p1 -i $(PACKAGES_DIR)/python/Python-2.7.3-xcompile.patch -d $(BUILD_DIR)/Python-2.7.3
	@( cd $(BUILD_DIR)/Python-2.7.3 && \
		CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc \
		CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++ \
		AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar \
		RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib \
		./configure \
		--host=arm-linux \
		--build=$(CONFIG_HOST) \
		--prefix=/usr )
	@make HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython HOSTPGEN=$(BUILD_DIR)/Python-2.7.3/Parser/hostpgen -C $(BUILD_DIR)/Python-2.7.3 BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes HOSTARCH=arm-linux BUILDARCH=$(CONFIG_HOST) -C $(BUILD_DIR)/Python-2.7.3
	@make install HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes prefix=$(ROOTFS_DIR)/usr -C $(BUILD_DIR)/Python-2.7.3
	@rm -rf $(BUILD_DIR)/Python-2.7.3
	@echo $(NAME) >> $(LOG_DIR)/system.packages
