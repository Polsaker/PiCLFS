include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := gmp
SOURCE := $(PACKAGES_DIR)/$(NAME)/gmp-6.1.2.tar.xz

toolchain:
	@$(STEP) "GMP 6.1.2"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/gmp-6.1.2 && \
	./configure --prefix=$(TOOLS_DIR)/usr --disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gmp-6.1.2
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gmp-6.1.2
	@rm -rf $(BUILD_DIR)/gmp-6.1.2
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

staging:
	@$(STEP) "GMP 6.1.2"
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
	@( cd $(BUILD_DIR)/gmp-6.1.2 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--enable-cxx \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gmp-6.1.2
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/gmp-6.1.2
	@rm -rf $(BUILD_DIR)/gmp-6.1.2
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "GMP 6.1.2"
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
	@( cd $(BUILD_DIR)/gmp-6.1.2 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--enable-cxx \
	--disable-static \
	--docdir=/usr/share/doc/gmp-6.1.2 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/gmp-6.1.2
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/gmp-6.1.2
	@rm -rf $(BUILD_DIR)/gmp-6.1.2
	@echo $(NAME) >> $(LOG_DIR)/system.packages
