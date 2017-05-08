NAME := pixman
SOURCE := $(PACKAGES_DIR)/$(NAME)/pixman-0.34.0.tar.gz

staging:
	@$(STEP) "Pixman 0.34.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/pixman-0.34.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static \
	--enable-shared \
	--disable-gtk \
	--enable-arm-simd \
	--enable-arm-neon \
	--disable-arm-iwmmxt )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pixman-0.34.0
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/pixman-0.34.0
	@rm -rf $(BUILD_DIR)/pixman-0.34.0
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Pixman 0.34.0"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/pixman-0.34.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--disable-static \
	--enable-shared \
	--disable-gtk \
	--enable-arm-simd \
	--enable-arm-neon \
	--disable-arm-iwmmxt )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pixman-0.34.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/pixman-0.34.0
	@rm -rf $(BUILD_DIR)/pixman-0.34.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
