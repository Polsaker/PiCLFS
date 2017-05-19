include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := bash
SOURCE := $(PACKAGES_DIR)/$(NAME)/bash-4.4.tar.gz
TARGET_DEPENDENCIES := readline

system:
	@$(STEP) "Bash 4.4"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/bash-4.4-upstream_fixes-1.patch -d $(BUILD_DIR)/bash-4.4
	@( cd $(BUILD_DIR)/bash-4.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--docdir=/usr/share/doc/bash-4.4 \
	--without-bash-malloc \
	--with-installed-readline )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/bash-4.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/bash-4.4
	@mv -vf $(ROOTFS_DIR)/usr/bin/bash $(ROOTFS_DIR)/bin
	@ln -svf bash $(ROOTFS_DIR)/bin/sh
	@rm -rf $(BUILD_DIR)/bash-4.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
