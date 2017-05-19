include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := readline
SOURCE := $(PACKAGES_DIR)/$(NAME)/readline-7.0.tar.gz
TARGET_DEPENDENCIES := ncurses

staging:
	@$(STEP) "Readline 7.0"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@sed -i '/MV.*old/d' $(BUILD_DIR)/readline-7.0/Makefile.in
	@sed -i '/{OLDSUFF}/c:' $(BUILD_DIR)/readline-7.0/support/shlib-install
	@( cd $(BUILD_DIR)/readline-7.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) SHLIB_LIBS="-lncursesw" -C $(BUILD_DIR)/readline-7.0
	@make -j$(CONFIG_PARALLEL_JOBS) SHLIB_LIBS="-lncurses" install -C $(BUILD_DIR)/readline-7.0
	@rm -rf $(BUILD_DIR)/readline-7.0
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Readline 7.0"
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
	@sed -i '/MV.*old/d' $(BUILD_DIR)/readline-7.0/Makefile.in
	@sed -i '/{OLDSUFF}/c:' $(BUILD_DIR)/readline-7.0/support/shlib-install
	@( cd $(BUILD_DIR)/readline-7.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/readline-7.0 )
	@make -j$(CONFIG_PARALLEL_JOBS) SHLIB_LIBS="-lncursesw" -C $(BUILD_DIR)/readline-7.0
	@make -j$(CONFIG_PARALLEL_JOBS) SHLIB_LIBS="-lncurses" DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/readline-7.0
	@mv -v $(ROOTFS_DIR)/usr/lib/libreadline.so.* $(ROOTFS_DIR)/lib
	@mv -v $(ROOTFS_DIR)/usr/lib/libhistory.so.* $(ROOTFS_DIR)/lib
	@ln -sfv ../../lib/`readlink $(ROOTFS_DIR)/usr/lib/libreadline.so` $(ROOTFS_DIR)/usr/lib/libreadline.so
	@ln -sfv ../../lib/`readlink $(ROOTFS_DIR)/usr/lib/libhistory.so` $(ROOTFS_DIR)/usr/lib/libhistory.so
	@rm -rf $(BUILD_DIR)/readline-7.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
