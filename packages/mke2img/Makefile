NAME := mke2img
SOURCE := $(PACKAGES_DIR)/$(NAME)/mke2img

toolchain:
	@$(STEP) "mke2img"
	@install -Dv -m 0755 $(SOURCE) $(TOOLS_DIR)/usr/bin/mke2img
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
