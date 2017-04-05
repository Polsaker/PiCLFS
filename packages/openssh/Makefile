include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := openssh
SOURCE := $(PACKAGES_DIR)/$(NAME)/openssh-7.4p1.tar.gz
TARGET_DEPENDENCIES := openssl

system:
	@$(STEP) "Openssh 7.4p1"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/openssh-7.4p1 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc/ssh \
	--with-md5-passwords \
	--with-privsep-path=/var/lib/sshd \
	--disable-strip )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/openssh-7.4p1
	@install -v -m700 -d $(ROOTFS_DIR)/var/lib/sshd
	@rm -rf $(ROOTFS_DIR)/usr/share/man/man8
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/openssh-7.4p1
	@install -v -m755 $(BUILD_DIR)/openssh-7.4p1/contrib/ssh-copy-id $(ROOTFS_DIR)/usr/bin
	@echo 'sshd:x:50:' >> $(ROOTFS_DIR)/etc/group
	@echo 'sshd:x:50:50:sshd PrivSep:/var/lib/sshd:/bin/false' >> $(ROOTFS_DIR)/etc/passwd
	@echo "PermitRootLogin yes" >> $(ROOTFS_DIR)/etc/ssh/sshd_config
	@echo "PasswordAuthentication yes" >> $(ROOTFS_DIR)/etc/ssh/sshd_config
	@cp -v $(PACKAGES_DIR)/openssh/sshd $(ROOTFS_DIR)/etc/rc.d/init.d/sshd
	@chmod -v 755 $(ROOTFS_DIR)/etc/rc.d/init.d/sshd
	@ln -svf ../init.d/sshd $(ROOTFS_DIR)/etc/rc.d/start/S50sshd
	@rm -rf $(BUILD_DIR)/openssh-7.4p1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
