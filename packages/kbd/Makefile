include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := kbd
SOURCE := $(PACKAGES_DIR)/$(NAME)/kbd-2.0.4.tar.xz

system:
	@$(STEP) "Kbd 2.0.4"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/kbd-2.0.4-backspace-1.patch -d $(BUILD_DIR)/kbd-2.0.4
	@sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' $(BUILD_DIR)/kbd-2.0.4/configure
	@sed -i 's/resizecons.8 //' $(BUILD_DIR)/kbd-2.0.4/docs/man/man8/Makefile.in
	@( cd $(BUILD_DIR)/kbd-2.0.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-vlock )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/kbd-2.0.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/kbd-2.0.4
	@rm -rf $(BUILD_DIR)/kbd-2.0.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
