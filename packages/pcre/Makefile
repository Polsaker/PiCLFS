NAME := pcre
SOURCE := $(PACKAGES_DIR)/$(NAME)/pcre-8.40.tar.bz2

staging:
	@$(STEP) "PCRE 8.40"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/pcre-8.40 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=$(SYSROOT_DIR)/usr \
	--enable-unicode-properties \
	--enable-pcre16 \
	--enable-pcre32 \
	--enable-pcregrep-libz \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pcre-8.40
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/pcre-8.40
	@rm -rf $(BUILD_DIR)/pcre-8.40
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "PCRE 8.40"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/pcre-8.40 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--docdir=/usr/share/doc/pcre-8.40 \
	--enable-unicode-properties \
	--enable-pcre16 \
	--enable-pcre32 \
	--enable-pcregrep-libz \
	--disable-static )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/pcre-8.40
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/pcre-8.40
	@mv -v $(ROOTFS_DIR)/usr/lib/libpcre.so.* $(ROOTFS_DIR)/lib
	@ln -sfv ../../lib/`readlink $(ROOTFS_DIR)/usr/lib/libpcre.so` $(ROOTFS_DIR)/usr/lib/libpcre.so
	@rm -rf $(BUILD_DIR)/pcre-8.40
	@echo $(NAME) >> $(LOG_DIR)/system.packages
