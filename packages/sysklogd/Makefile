include $(WORKSPACE_DIR)/support/dependencies.mk

NAME := sysklogd
SOURCE := $(PACKAGES_DIR)/$(NAME)/sysklogd-1.5.1.tar.gz

system:
	@$(STEP) "Sysklogd 1.5.1"
	@$(call system_dependencies, $(TARGET_DEPENDENCIES))
	@$(EXTRACT) $(SOURCE) $(BUILD_DIR)
	@sed -i '/Error loading kernel symbols/{n;n;d}' $(BUILD_DIR)/sysklogd-1.5.1/ksym_mod.c
	@sed -i 's/union wait/int/' $(BUILD_DIR)/sysklogd-1.5.1/syslogd.c
	@make -j$(CONFIG_PARALLEL_JOBS) CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc -C $(BUILD_DIR)/sysklogd-1.5.1
	@install -D -m 0500 $(BUILD_DIR)/sysklogd-1.5.1/syslogd $(ROOTFS_DIR)/sbin/syslogd
	@install -D -m 0500 $(BUILD_DIR)/sysklogd-1.5.1/klogd $(ROOTFS_DIR)/sbin/klogd
	@install -D -m 0644 $(PACKAGES_DIR)/$(NAME)/syslog.conf $(ROOTFS_DIR)/etc/syslog.conf
	@rm -rf $(BUILD_DIR)/sysklogd-1.5.1
	@echo $(NAME) >> $(LOG_DIR)/system.packages
