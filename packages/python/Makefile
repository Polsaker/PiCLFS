include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := python
SOURCE := $(PACKAGES_DIR)/$(NAME)/Python-2.7.3.tar.xz
TARGET_DEPENDENCIES := libffi

staging:
	@$(STEP) "Python 2.7.3"
	@$(call staging_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/Python-2.7.3 && ./configure )
	@make -j$(CONFIG_PARALLEL_JOBS) python Parser/pgen -C $(BUILD_DIR)/Python-2.7.3
	@mv $(BUILD_DIR)/Python-2.7.3/python $(BUILD_DIR)/Python-2.7.3/hostpython
	@mv $(BUILD_DIR)/Python-2.7.3/Parser/pgen $(BUILD_DIR)/Python-2.7.3/Parser/hostpgen
	@make distclean -C $(BUILD_DIR)/Python-2.7.3
	@patch -p1 -i $(PACKAGES_DIR)/python/Python-2.7.3-xcompile.patch -d $(BUILD_DIR)/Python-2.7.3
	@( cd $(BUILD_DIR)/Python-2.7.3 && \
		CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc \
		CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++ \
		AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar \
		RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib \
		./configure \
		--host=arm-linux \
		--build=$(CONFIG_HOST) \
		--prefix=/usr )
	@make HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython HOSTPGEN=$(BUILD_DIR)/Python-2.7.3/Parser/hostpgen -C $(BUILD_DIR)/Python-2.7.3 BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes HOSTARCH=arm-linux BUILDARCH=$(CONFIG_HOST) -C $(BUILD_DIR)/Python-2.7.3
	@make install HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes prefix=$(SYSROOT_DIR) -C $(BUILD_DIR)/Python-2.7.3
	@rm -rf $(BUILD_DIR)/Python-2.7.3
	@echo $(NAME) >> $(LOG_DIR)/staging.packages

system:
	@$(STEP) "Python 2.7.3"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/Python-2.7.3 && ./configure )
	@make -j$(CONFIG_PARALLEL_JOBS) python Parser/pgen -C $(BUILD_DIR)/Python-2.7.3
	@mv $(BUILD_DIR)/Python-2.7.3/python $(BUILD_DIR)/Python-2.7.3/hostpython
	@mv $(BUILD_DIR)/Python-2.7.3/Parser/pgen $(BUILD_DIR)/Python-2.7.3/Parser/hostpgen
	@make distclean -C $(BUILD_DIR)/Python-2.7.3
	@patch -p1 -i $(PACKAGES_DIR)/python/Python-2.7.3-xcompile.patch -d $(BUILD_DIR)/Python-2.7.3
	@( cd $(BUILD_DIR)/Python-2.7.3 && \
		CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc \
		CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++ \
		AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar \
		RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib \
		./configure \
		--host=arm-linux \
		--build=$(CONFIG_HOST) \
		--prefix=/usr )
	@make HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython HOSTPGEN=$(BUILD_DIR)/Python-2.7.3/Parser/hostpgen -C $(BUILD_DIR)/Python-2.7.3 BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes HOSTARCH=arm-linux BUILDARCH=$(CONFIG_HOST) -C $(BUILD_DIR)/Python-2.7.3
	@make install HOSTPYTHON=$(BUILD_DIR)/Python-2.7.3/hostpython BLDSHARED="$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -shared" CROSS_COMPILE=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)- CROSS_COMPILE_TARGET=yes prefix=$(SYSROOT_DIR) -C $(BUILD_DIR)/Python-2.7.3
	@rm -rf $(BUILD_DIR)/Python-2.7.3
	@echo $(NAME) >> $(LOG_DIR)/system.packages
