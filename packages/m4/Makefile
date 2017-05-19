include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := m4
SOURCE := $(PACKAGES_DIR)/$(NAME)/m4-1.4.18.tar.xz

toolchain:
	@$(STEP) "M4 1.4.18"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/m4-1.4.18 && ./configure --prefix=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/m4-1.4.18
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/m4-1.4.18
	@rm -rf $(BUILD_DIR)/m4-1.4.18
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages

system:
	@$(STEP) "M4 1.4.18"
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
	@( cd $(BUILD_DIR)/m4-1.4.18 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/m4-1.4.18
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/m4-1.4.18
	@rm -rf $(BUILD_DIR)/m4-1.4.18
	@echo $(NAME) >> $(LOG_DIR)/system.packages
