include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := coreutils
SOURCE := $(PACKAGES_DIR)/$(NAME)/coreutils-8.27.tar.xz

system:
	@$(STEP) "Coreutils 8.27"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/coreutils-8.27-i18n-1.patch -d $(BUILD_DIR)/coreutils-8.27
	@sed -i 's@/man/help2man@/man/help2man --no-discard-stderr@g' $(BUILD_DIR)/coreutils-8.27/man/local.mk
	@( cd $(BUILD_DIR)/coreutils-8.27 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--enable-no-install-program=kill,uptime )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/coreutils-8.27
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/coreutils-8.27
	@mv -v $(ROOTFS_DIR)/usr/bin/cat $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/chgrp $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/chmod $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/chown $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/cp $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/date $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/dd $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/df $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/echo $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/false $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/ln $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/ls $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/mkdir $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/mknod $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/mv $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/pwd $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/rm $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/rmdir $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/stty $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/sync $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/true $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/uname $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/chroot $(ROOTFS_DIR)/usr/sbin
	@mv -v $(ROOTFS_DIR)/usr/share/man/man1/chroot.1 $(ROOTFS_DIR)/usr/share/man/man8/chroot.8
	@sed -i s/\"1\"/\"8\"/1 $(ROOTFS_DIR)/usr/share/man/man8/chroot.8
	@mv -v $(ROOTFS_DIR)/usr/bin/head $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/sleep $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/nice $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/test $(ROOTFS_DIR)/bin
	@mv -v $(ROOTFS_DIR)/usr/bin/[ $(ROOTFS_DIR)/bin
	@rm -rf $(BUILD_DIR)/coreutils-8.27
	@echo $(NAME) >> $(LOG_DIR)/system.packages
