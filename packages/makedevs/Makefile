SOURCE := $(PACKAGES_DIR)/makedevs/makedevs.c

toolchain:
	@$(STEP) "mke2img"
	@mkdir -p $(BUILD_DIR)/makedevs
	@gcc -O2 -I$(TOOLS_DIR)/usr/include $(SOURCE) -o $(BUILD_DIR)/makedevs/makedevs -L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib
	@install -Dv -m 755 $(BUILD_DIR)/makedevs/makedevs $(TOOLS_DIR)/usr/bin/makedevs
	@rm -rf $(BUILD_DIR)/makedevs
