include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := libwnck
SOURCE := $(PACKAGES_DIR)/$(NAME)/libwnck-2.30.7.tar.xz
TARGET_DEPENDENCIES := libgtk2

staging:
	@$(STEP) "libwnck 2.30.7"
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
	@( cd $(BUILD_DIR)/libwnck-2.30.7 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--program-suffix=-1 )
	@make -j$(CONFIG_PARALLEL_JOBS) GETTEXT_PACKAGE=libwnck-1 -C $(BUILD_DIR)/libwnck-2.30.7
	@make -j$(CONFIG_PARALLEL_JOBS) GETTEXT_PACKAGE=libwnck-1 install -C $(BUILD_DIR)/libwnck-2.30.7
	@rm -rf $(BUILD_DIR)/libwnck-2.30.7
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "libwnck 2.30.7"
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
	@( cd $(BUILD_DIR)/libwnck-2.30.7 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-static \
	--program-suffix=-1 )
	@make -j$(CONFIG_PARALLEL_JOBS) GETTEXT_PACKAGE=libwnck-1 -C $(BUILD_DIR)/libwnck-2.30.7
	@make -j$(CONFIG_PARALLEL_JOBS) GETTEXT_PACKAGE=libwnck-1 DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/libwnck-2.30.7
	@rm -rf $(BUILD_DIR)/libwnck-2.30.7
	@echo $(NAME) >> $(LOG_DIR)/system.packages
