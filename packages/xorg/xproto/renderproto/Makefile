NAME := renderproto
SOURCE := $(PACKAGES_DIR)/xorg/xproto/$(NAME)/renderproto-0.11.1.tar.bz2

staging:
	@$(STEP) "Renderproto 0.11.1"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/renderproto-0.11.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--sysconfdir=$(SYSROOT_DIR)/etc \
	--localstatedir=$(SYSROOT_DIR)/var \
	--disable-static \
	--enable-shared )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/renderproto-0.11.1
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/renderproto-0.11.1
	@rm -rf $(BUILD_DIR)/renderproto-0.11.1
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Renderproto 0.11.1"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/renderproto-0.11.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-shared )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/renderproto-0.11.1
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/renderproto-0.11.1
	@rm -rf $(BUILD_DIR)/renderproto-0.11.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
