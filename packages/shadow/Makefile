include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := shadow
SOURCE := $(PACKAGES_DIR)/$(NAME)/shadow-4.4.tar.xz

system:
	@$(STEP) "Shadow 4.4"
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
	@sed -i 's/groups$(EXEEXT) //' $(BUILD_DIR)/shadow-4.4/src/Makefile.in
	@find $(BUILD_DIR)/shadow-4.4/man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
	@find $(BUILD_DIR)/shadow-4.4/man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
	@find $(BUILD_DIR)/shadow-4.4/man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;
	@sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' -e 's@/var/spool/mail@/var/mail@' $(BUILD_DIR)/shadow-4.4/etc/login.defs
	@patch -Np0 -l -i $(PACKAGES_DIR)/$(NAME)/shadow-4.4_1.patch -d $(BUILD_DIR)/shadow-4.4
	@sed -i 's/1000/999/' $(BUILD_DIR)/shadow-4.4/etc/useradd
	@sed -i -e '47 d' -e '60,65 d' $(BUILD_DIR)/shadow-4.4/libmisc/myname.c
	@( cd $(BUILD_DIR)/shadow-4.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--sysconfdir=/etc \
	--with-group-name-max-length=32 \
	--without-libpam )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/shadow-4.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/shadow-4.4
	@sed -i 's/yes/no/' $(ROOTFS_DIR)/etc/default/useradd
	@rm -rf $(BUILD_DIR)/shadow-4.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
