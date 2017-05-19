include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := iproute2
SOURCE := $(PACKAGES_DIR)/$(NAME)/iproute2-4.10.0.tar.xz

system:
	@$(STEP) "Iproute2 4.10.0"
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
	@sed -i /ARPD/d $(BUILD_DIR)/iproute2-4.10.0/Makefile
	@sed -i 's/arpd.8//' $(BUILD_DIR)/iproute2-4.10.0/man/man8/Makefile
	@rm -v $(BUILD_DIR)/iproute2-4.10.0/doc/arpd.sgml
	@sed -i 's/m_ipt.o//' $(BUILD_DIR)/iproute2-4.10.0/tc/Makefile
	@( cd $(BUILD_DIR)/iproute2-4.10.0 && \
	./configure \
	--target=$(CONFIG_TARGET) \
	--host=$(CONFIG_TARGET) \
	--build=$(CONFIG_HOST) \
	--prefix=/usr \
	--docdir=/usr/share/doc/iproute2-4.10.0 )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/iproute2-4.10.0
	@make -j$(CONFIG_PARALLEL_JOBS) DESTDIR=$(ROOTFS_DIR) install -C $(BUILD_DIR)/iproute2-4.10.0
	@rm -rf $(BUILD_DIR)/iproute2-4.10.0
	@echo $(NAME) >> $(LOG_DIR)/system.packages
