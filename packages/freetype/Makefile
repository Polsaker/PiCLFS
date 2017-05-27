include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := freetype
SOURCE := $(PACKAGES_DIR)/$(NAME)/freetype-2.7.1.tar.bz2
TARGET_DEPENDENCIES := libpng

staging:
	@$(STEP) "FreeType 2.7.1"
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
	@sed -ri "s:.*(AUX_MODULES.*valid):\1:" $(BUILD_DIR)/freetype-2.7.1/modules.cfg
	@sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" -i $(BUILD_DIR)/freetype-2.7.1/include/freetype/config/ftoption.h
	@( cd $(BUILD_DIR)/freetype-2.7.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/freetype-2.7.1
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/freetype-2.7.1
	@rm -rf $(BUILD_DIR)/freetype-2.7.1
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "FreeType 2.7.1"
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
	@sed -ri "s:.*(AUX_MODULES.*valid):\1:" $(BUILD_DIR)/freetype-2.7.1/modules.cfg
	@sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" -i $(BUILD_DIR)/freetype-2.7.1/include/freetype/config/ftoption.h
	@( cd $(BUILD_DIR)/freetype-2.7.1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
 	--prefix=/usr \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/freetype-2.7.1
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/freetype-2.7.1
	@rm -rf $(BUILD_DIR)/freetype-2.7.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
