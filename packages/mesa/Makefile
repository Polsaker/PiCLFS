include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := mesa
SOURCE := $(PACKAGES_DIR)/$(NAME)/mesa-17.1.0.tar.xz
TARGET_DEPENDENCIES := xlib libdrm

staging:
	@$(STEP) "Mesa 17.1.0"
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
	@sed -i "/pthread_stubs_possible=/s/yes/no/" $(BUILD_DIR)/mesa-17.1.0/configure.ac
	@( cd $(BUILD_DIR)/mesa-17.1.0 && \
	./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2' \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--enable-texture-float \
	--enable-osmesa \
	--enable-xa \
	--enable-glx-tls \
	--with-platforms="drm,x11" \
	--with-gallium-drivers="vc4" \
	--with-dri-drivers= )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mesa-17.1.0
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/mesa-17.1.0
	@rm -rf $(BUILD_DIR)/mesa-17.1.0
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Mesa 17.1.0"
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
	@sed -i "/pthread_stubs_possible=/s/yes/no/" $(BUILD_DIR)/mesa-17.1.0/configure.ac
	@( cd $(BUILD_DIR)/mesa-17.1.0 && \
	./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2' \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--enable-texture-float \
	--enable-osmesa \
	--enable-xa \
	--enable-glx-tls \
	--with-platforms="drm,x11" \
	--with-gallium-drivers="vc4" \
	--with-dri-drivers= )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mesa-17.1.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/mesa-17.1.0
	@rm -rf $(BUILD_DIR)/mesa-17.1.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
