NAME := cairo
SOURCE := $(PACKAGES_DIR)/$(NAME)/cairo-1.14.8.part*
TARGET_DEPENDENCIES := libpng pixman

staging:
	@$(STEP) "Cairo 1.14.8"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(SOURCE) | tar Jxf -  -C $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/cairo-1.14.8 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--enable-shared \
	--enable-trace=no \
	--enable-interpreter=no \
	--disable-directfb \
	--enable-ft \
	--enable-gobject \
	--disable-gl \
	--disable-glesv2 \
	--disable-vg \
	--enable-xlib \
	--enable-xcb \
	--with-x \
	--enable-xlib-xrender \
	--enable-ps \
	--enable-pdf \
	--enable-png \
	--disable-script \
	--enable-svg \
	--enable-tee \
	--disable-xml )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/cairo-1.14.8
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/cairo-1.14.8
	@rm -rf $(BUILD_DIR)/cairo-1.14.8
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Cairo 1.14.8"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@cat $(SOURCE) | tar Jxf -  -C $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/cairo-1.14.8 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--disable-static \
	--enable-shared \
	--enable-trace=no \
	--enable-interpreter=no \
	--disable-directfb \
	--enable-ft \
	--enable-gobject \
	--disable-gl \
	--disable-glesv2 \
	--disable-vg \
	--enable-xlib \
	--enable-xcb \
	--with-x \
	--enable-xlib-xrender \
	--enable-ps \
	--enable-pdf \
	--enable-png \
	--disable-script \
	--enable-svg \
	--enable-tee \
	--disable-xml )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/cairo-1.14.8
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/cairo-1.14.8
	@rm -rf $(BUILD_DIR)/cairo-1.14.8
	@echo $(NAME) >> $(LOG_DIR)/system.packages
