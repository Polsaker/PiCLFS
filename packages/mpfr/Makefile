include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := mpfr
SOURCE := $(PACKAGES_DIR)/$(NAME)/mpfr-3.1.5.tar.xz
HOST_DEPENDENCIES := gmp

toolchain:
	@$(STEP) "MPFR 3.1.5"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/mpfr-3.1.5 && \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--disable-static \
	--with-gmp=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mpfr-3.1.5
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/mpfr-3.1.5
	@rm -rf $(BUILD_DIR)/mpfr-3.1.5
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
