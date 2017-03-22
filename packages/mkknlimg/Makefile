NAME := mkknlimg
SOURCE := $(PACKAGES_DIR)/$(NAME)/mkknlimg

toolchain:
	@$(STEP) "mkknlimg"
	@install -Dv -m 0755 $(SOURCE) $(TOOLS_DIR)/usr/bin/mkknlimg
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
