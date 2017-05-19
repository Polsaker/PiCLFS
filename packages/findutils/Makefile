include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := findutils
SOURCE := $(PACKAGES_DIR)/$(NAME)/findutils-4.6.0.tar.gz

system:
	@$(STEP) "Findutils 4.6.0"
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
	@( cd $(BUILD_DIR)/findutils-4.6.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--localstatedir=/var/lib/locate )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/findutils-4.6.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/findutils-4.6.0
	@mv -v $(ROOTFS_DIR)/usr/bin/find $(ROOTFS_DIR)/bin
	@sed -i 's/find:=${BINDIR}/find:=\/bin/' $(ROOTFS_DIR)/usr/bin/updatedb
	@rm -rf $(BUILD_DIR)/findutils-4.6.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
