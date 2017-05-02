NAME := icu
SOURCE := $(PACKAGES_DIR)/$(NAME)/icu4c-59_1-src.tgz

staging:
	@$(STEP) "ICU 59.1"
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
	@mkdir -p $(BUILD_DIR)/icu/source/host
	@( cd $(BUILD_DIR)/icu/source/host && \
	$(BUILD_DIR)/icu/source/runConfigureICU	Linux/gcc )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/icu/source/host
	@( cd $(BUILD_DIR)/icu/source && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--with-cross-build=$(BUILD_DIR)/icu/source/host \
	--disable-samples \
	--disable-tests )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/icu/source
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/icu/source
	@rm -rf $(BUILD_DIR)/icu/source
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "ICU 59.1"
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
	@mkdir -p $(BUILD_DIR)/icu/source/host
	@( cd $(BUILD_DIR)/icu/source/host && \
	$(BUILD_DIR)/icu/source/runConfigureICU	Linux/gcc )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/icu/source/host
	@( cd $(BUILD_DIR)/icu/source && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--with-cross-build=$(BUILD_DIR)/icu/source/host \
	--disable-samples \
	--disable-tests )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/icu/source
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/icu/source
	@rm -rf $(BUILD_DIR)/icu/source
	@echo $(NAME) >> $(LOG_DIR)/system.packages
