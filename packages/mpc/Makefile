include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := mpc
SOURCE := $(PACKAGES_DIR)/$(NAME)/mpc-1.0.3.tar.gz
HOST_DEPENDENCIES := gmp mpfr

toolchain:
	@$(STEP) "MPC 1.0.3"
	@$(call toolchain_dependencies, $(HOST_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@( cd $(BUILD_DIR)/mpc-1.0.3 && \
	LDFLAGS="-L$(TOOLS_DIR)/lib -L$(TOOLS_DIR)/usr/lib -Wl,-rpath,$(TOOLS_DIR)/usr/lib" \
	./configure \
	--prefix=$(TOOLS_DIR)/usr \
	--disable-static \
	--with-gmp=$(TOOLS_DIR)/usr \
	--with-mpfr=$(TOOLS_DIR)/usr )
	@make -j$(CONFIG_PARALLEL_JOBS) -C $(BUILD_DIR)/mpc-1.0.3
	@make -j$(CONFIG_PARALLEL_JOBS) install -C $(BUILD_DIR)/mpc-1.0.3
	@rm -rf $(BUILD_DIR)/mpc-1.0.3
	@echo $(NAME) >> $(LOG_DIR)/toolchain.packages
