include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xfonts
SOURCE := font-bh-type1-1.0.3 encodings-1.0.4 font-ibm-type1-1.0.3 font-adobe-utopia-type1-1.0.4 font-misc-ethiopic-1.0.3 font-alias-1.0.3 font-util-1.3.1 font-bh-ttf-1.0.3 font-xfree86-type1-1.0.4
TARGET_DEPENDENCIES := xcursor-themes

staging:
	@$(STEP) "Xorg Fonts"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@for xfonts in $(SOURCE) ; do \
		$(EXTRACT) $(PACKAGES_DIR)/xorg/xfonts/$${xfonts}.tar.bz2 $(BUILD_DIR) ; \
		( cd $(BUILD_DIR)/$${xfonts} && \
		./configure \
		--target=$(CONFIG_TARGET) \
		--host=$(CONFIG_TARGET) \
		--build=$(CONFIG_HOST) \
		--prefix=$(SYSROOT_DIR)/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-static \
		--enable-malloc0returnsnull ) || exit 1; \
		make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/$${xfonts} || exit 1; \
		make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/$${xfonts} || exit 1; \
		rm -rf $(BUILD_DIR)/$${xfonts} ; \
	done
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Xorg Fonts"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@for xfonts in $(SOURCE) ; do \
		$(EXTRACT) $(PACKAGES_DIR)/xorg/xfonts/$${xfonts}.tar.bz2 $(BUILD_DIR) ; \
		( cd $(BUILD_DIR)/$${xfonts} && \
		./configure \
		--target=$(CONFIG_TARGET) \
		--host=$(CONFIG_TARGET) \
		--build=$(CONFIG_HOST) \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-static \
		--enable-malloc0returnsnull ) || exit 1; \
		make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/$${xfonts} || exit 1; \
		make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/$${xfonts} || exit 1; \
		rm -rf $(BUILD_DIR)/$${xfonts} ; \
	done
	@echo $(NAME) >> $(LOG_DIR)/system.packages
