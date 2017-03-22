NAME := mkpasswd
SOURCE := $(PACKAGES_DIR)/$(NAME)

toolchain:
	@$(STEP) "mkpasswd 5.0.26"
	@mkdir -p $(BUILD_DIR)/mkpasswd-5.0.26
	@gcc -O2 -I$(TOOLS_DIR)/usr/include -L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib $(SOURCE)/mkpasswd.c $(SOURCE)/utils.c -o $(BUILD_DIR)/mkpasswd-5.0.26/mkpasswd -lcrypt
	@install -Dv -m 755 $(BUILD_DIR)/mkpasswd-5.0.26/mkpasswd $(TOOLS_DIR)/usr/bin/mkpasswd
	@rm -rf $(BUILD_DIR)/mkpasswd-5.0.26
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
