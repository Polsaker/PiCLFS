define toolchain_dependencies
	@for dependencie in $(1) ; do \
		if ! grep -q $${dependencie} $(LOG_DIR)/toolchain.packages ; then \
			$(ERROR) "[!! ERROR !!] Dependency package '$${dependencie}' is not in step 'toolchain'." ; \
			exit 1 ; \
		fi ; \
	done
endef

define staging_dependencies
	@for dependencie in $(1) ; do \
		if ! grep -q $${dependencie} $(LOG_DIR)/staging.packages ; then \
			$(ERROR) "[!! ERROR !!] Dependency package '$${dependencie}' is not in step 'toolchain-staging'." ; \
			exit 1 ; \
		fi ; \
	done
endef

define system_dependencies
	@for dependencie in $(1) ; do \
		if ! grep -q $${dependencie} $(LOG_DIR)/staging.packages ; then \
			$(ERROR) "[!! ERROR !!] Dependency package '$${dependencie}' is not in step 'toolchain-staging'." ; \
			exit 1 ; \
		fi ; \
		if ! grep -q $${dependencie} $(LOG_DIR)/system.packages ; then \
			$(ERROR) "[!! ERROR !!] Dependency package '$${dependencie}' is not in step 'system'." ; \
			exit 1 ; \
		fi ; \
	done
endef
