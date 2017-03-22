NAME := openssl
SOURCE := $(PACKAGES_DIR)/$(NAME)/openssl-1.0.2k.tar.gz

staging:
	@$(STEP) "Openssl 1.0.2k"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/openssl-1.0.2k && \
	CROSS_COMPILE=$(CONFIG_TARGET)- \
	./Configure \
	linux-armv4 \
	--prefix=/usr \
	--openssldir=/etc/ssl \
	--libdir=/lib \
	shared \
	zlib-dynamic )
	@sed -i -e "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(BUILD_DIR)/openssl-1.0.2k/Makefile
	@sed -i -e "s# build_tests##" $(BUILD_DIR)/openssl-1.0.2k/Makefile
	@make -j1 -C $(BUILD_DIR)/openssl-1.0.2k
	@make -j1 INSTALL_PREFIX=$(SYSROOT_DIR) install -C $(BUILD_DIR)/openssl-1.0.2k
	@rm -rf $(BUILD_DIR)/openssl-1.0.2k
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Openssl 1.0.2k"
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@( cd $(BUILD_DIR)/openssl-1.0.2k && \
	CROSS_COMPILE=$(CONFIG_TARGET)- \
	./Configure \
	linux-armv4 \
	--prefix=/usr \
	--openssldir=/etc/ssl \
	--libdir=/lib \
	shared \
	zlib-dynamic )
	@sed -i -e "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(BUILD_DIR)/openssl-1.0.2k/Makefile
	@sed -i -e "s# build_tests##" $(BUILD_DIR)/openssl-1.0.2k/Makefile
	@make -j1 -C $(BUILD_DIR)/openssl-1.0.2k
	@make -j1 INSTALL_PREFIX=$(ROOTFS_DIR) install -C $(BUILD_DIR)/openssl-1.0.2k
	@rm -rf $(BUILD_DIR)/openssl-1.0.2k
	@echo $(NAME) >> $(LOG_DIR)/system.packages
