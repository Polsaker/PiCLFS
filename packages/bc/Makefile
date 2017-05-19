include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := bc
SOURCE := $(PACKAGES_DIR)/$(NAME)/bc-1.06.95.tar.bz2
TARGET_DEPENDENCIES := ncurses readline

system:
	@$(STEP) "Bc 1.06.95"
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
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/array_initialize.patch -d $(BUILD_DIR)/bc-1.06.95
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/notice_read_write_errors.patch -d $(BUILD_DIR)/bc-1.06.95
	@patch -Np1 -i $(PACKAGES_DIR)/$(NAME)/use_appropiate_makeinfo.patch -d $(BUILD_DIR)/bc-1.06.95
	@( cd $(BUILD_DIR)/bc-1.06.95 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--with-readline \
	--mandir=/usr/share/man \
	--infodir=/usr/share/info )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/bc-1.06.95
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/bc-1.06.95
	@rm -rf $(BUILD_DIR)/bc-1.06.95
	@echo $(NAME) >> $(LOG_DIR)/system.packages
