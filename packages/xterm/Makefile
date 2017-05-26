include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := xterm
SOURCE := $(PACKAGES_DIR)/$(NAME)/xterm-327.tgz

system:
	@$(STEP) "Xterm 327"
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
	@sed -i '/v0/{n;s/new:/new:kb=^?:/}' $(BUILD_DIR)/xterm-327/termcap
	@printf '\tkbs=\\177,\n' >> $(BUILD_DIR)/xterm-327/terminfo
	@( cd $(BUILD_DIR)/xterm-327 && \
	TERMINFO=/usr/share/terminfo \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--with-app-defaults=/etc/X11/app-defaults )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/xterm-327
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/xterm-327
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install-ti -C $(BUILD_DIR)/xterm-327
	@mkdir -pv $(ROOTFS_DIR)/etc/X11/app-defaults
	@cp -v $(PACKAGES_DIR)/$(NAME)/XTerm $(ROOTFS_DIR)/etc/X11/app-defaults/XTerm
	@rm -rf $(BUILD_DIR)/xterm-327
	@echo $(NAME) >> $(LOG_DIR)/system.packages
