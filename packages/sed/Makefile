include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := sed
SOURCE := $(PACKAGES_DIR)/$(NAME)/sed-4.4.tar.xz
# TARGET_DEPENDENCIES := glib

system:
	@$(STEP) "Sed 4.4"
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
	@sed -i 's/usr/tools/' $(BUILD_DIR)/sed-4.4/build-aux/help2man
	@sed -i 's/panic-tests.sh//' $(BUILD_DIR)/sed-4.4/Makefile.in
	@( cd $(BUILD_DIR)/sed-4.4 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--bindir=/bin )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/sed-4.4
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/sed-4.4
	@rm -rf $(BUILD_DIR)/sed-4.4
	@echo $(NAME) >> $(LOG_DIR)/system.packages
