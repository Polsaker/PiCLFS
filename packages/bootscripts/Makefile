NAME := bootscripts
SOURCE := $(PACKAGES_DIR)/$(NAME)/bootscripts-embedded.tar.gz

system:
	@$(STEP) "Setting Up System Bootscripts"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@make DESTDIR=$(ROOTFS_DIR) install-bootscripts -C $(BUILD_DIR)/bootscripts-embedded
	@rm -rf $(BUILD_DIR)/bootscripts-embedded
	@echo $(NAME) >> $(LOG_DIR)/system.packages
