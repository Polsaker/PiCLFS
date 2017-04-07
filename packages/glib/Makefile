include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := glib
SOURCE := $(PACKAGES_DIR)/$(NAME)/glib-2.52.0.tar.xz
TARGET_DEPENDENCIES := libffi python pcre

staging:
	@$(STEP) "Glib 2.52.0"
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
	@sed -i -e "s# tests##" $(BUILD_DIR)/glib-2.52.0/Makefile.am
	@sed -i -e "s# tests##" $(BUILD_DIR)/glib-2.52.0/gio/Makefile.am
	@sed -i -e "s# tests##" $(BUILD_DIR)/glib-2.52.0/glib/Makefile.am
	@patch -Np0 -i $(PACKAGES_DIR)/glib/glib-2.52.0-as_fn_error.patch -d $(BUILD_DIR)/glib-2.52.0
	@( cd $(BUILD_DIR)/glib-2.52.0 && \
	glib_cv_long_long_format=ll \
	glib_cv_stack_grows=no \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
 	--with-pcre=system )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/glib-2.52.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(SYSROOT_DIR) install -C $(BUILD_DIR)/glib-2.52.0
	@rm -rf $(BUILD_DIR)/glib-2.52.0
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Glib 2.52.0"
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
	@sed -i -e "s# tests##" $(BUILD_DIR)/glib-2.52.0/Makefile.am
	@sed -i -e "s# tests##" $(BUILD_DIR)/glib-2.52.0/gio/Makefile.am
	@sed -i -e "s# tests##" $(BUILD_DIR)/glib-2.52.0/glib/Makefile.am
	@patch -Np0 -i $(PACKAGES_DIR)/glib/glib-2.52.0-as_fn_error.patch -d $(BUILD_DIR)/glib-2.52.0
	@( cd $(BUILD_DIR)/glib-2.52.0 && \
	glib_cv_long_long_format=ll \
	glib_cv_stack_grows=no \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
 	--with-pcre=system )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/glib-2.52.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/glib-2.52.0
	@rm -rf $(BUILD_DIR)/glib-2.52.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
