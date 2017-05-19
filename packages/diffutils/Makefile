include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := diffutils
SOURCE := $(PACKAGES_DIR)/$(NAME)/diffutils-3.5.tar.xz

system:
	@$(STEP) "Diffutils 3.5"
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
	@sed -i 's:= @mkdir_p@:= /bin/mkdir -p:' $(BUILD_DIR)/diffutils-3.5/po/Makefile.in.in
	@( cd $(BUILD_DIR)/diffutils-3.5 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/diffutils-3.5
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/diffutils-3.5
	@rm -rf $(BUILD_DIR)/diffutils-3.5
	@echo $(NAME) >> $(LOG_DIR)/system.packages
