include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := fontconfig
SOURCE := $(PACKAGES_DIR)/$(NAME)/fontconfig-2.12.1.tar.bz2
TARGET_DEPENDENCIES := libxml2 freetype

staging:
	@$(STEP) "Fontconfig 2.12.1"
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
	@sed -e '/FC_CHAR_WIDTH/s/CHAR_WIDTH/CHARWIDTH/' -e '/FC_CHARWIDTH/a #define FC_CHAR_WIDTH FC_CHARWIDTH' -i $(BUILD_DIR)/fontconfig-2.12.1/fontconfig/fontconfig.h
	@sed 's/CHAR_WIDTH/CHARWIDTH/' -i $(BUILD_DIR)/fontconfig-2.12.1/src/fcobjs.h
	@( cd $(BUILD_DIR)/fontconfig-2.12.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--enable-libxml2 \
	--disable-docs )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/fontconfig-2.12.1
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/fontconfig-2.12.1
	@rm -rf $(BUILD_DIR)/fontconfig-2.12.1
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Fontconfig 2.12.1"
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
	@sed -e '/FC_CHAR_WIDTH/s/CHAR_WIDTH/CHARWIDTH/' -e '/FC_CHARWIDTH/a #define FC_CHAR_WIDTH FC_CHARWIDTH' -i $(BUILD_DIR)/fontconfig-2.12.1/fontconfig/fontconfig.h
	@sed 's/CHAR_WIDTH/CHARWIDTH/' -i $(BUILD_DIR)/fontconfig-2.12.1/src/fcobjs.h
	@( cd $(BUILD_DIR)/fontconfig-2.12.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--enable-libxml2 \
	--disable-docs \
	--docdir=/usr/share/doc/fontconfig-2.12.1 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/fontconfig-2.12.1
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/fontconfig-2.12.1
	@rm -rf $(BUILD_DIR)/fontconfig-2.12.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
