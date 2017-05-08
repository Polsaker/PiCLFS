include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := pcmanfm
SOURCE := $(PACKAGES_DIR)/$(NAME)/pcmanfm-1.2.4.tar.xz
TARGET_DEPENDENCIES := libfm

staging:
	@$(STEP) "PCManFM 1.2.4"
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
	@( cd $(BUILD_DIR)/pcmanfm-1.2.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--disable-static \
	--enable-shared \
	--with-gtk=2 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pcmanfm-1.2.4
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/pcmanfm-1.2.4
	@rm -rf $(BUILD_DIR)/pcmanfm-1.2.4
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "PCManFM 1.2.4"
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
	@( cd $(BUILD_DIR)/pcmanfm-1.2.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--sysconfdir=/etc \
	--disable-static \
	--enable-shared \
	--with-gtk=2 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pcmanfm-1.2.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/pcmanfm-1.2.4
	@rm -rf $(BUILD_DIR)/pcmanfm-1.2.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
