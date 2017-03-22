NAME := tzdata
SOURCE := $(PACKAGES_DIR)/$(NAME)/tzdata2016j.tar.gz
ZONEINFO := $(ROOTFS_DIR)/usr/share/zoneinfo

system:
	@$(STEP) "Tzdata2016j"
	@mkdir -p $(BUILD_DIR)/tzdata2016j
	@tar -zxf $(SOURCE) -C $(BUILD_DIR)/tzdata2016j
	@export CC=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-gcc
	@export CXX=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-g++
	@export AR=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ar
	@export AS=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-as
	@export LD=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ld
	@export RANLIB=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-ranlib
	@export READELF=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-readelf
	@export STRIP=$(TOOLS_DIR)/usr/bin/$(CONFIG_TARGET)-strip
	@mkdir -pv $(ZONEINFO)/posix
	@mkdir -pv $(ZONEINFO)/right
	@for tz in $(BUILD_DIR)/tzdata2016j/etcetera $(BUILD_DIR)/tzdata2016j/southamerica $(BUILD_DIR)/tzdata2016j/northamerica $(BUILD_DIR)/tzdata2016j/europe $(BUILD_DIR)/tzdata2016j/africa $(BUILD_DIR)/tzdata2016j/antarctica $(BUILD_DIR)/tzdata2016j/asia $(BUILD_DIR)/tzdata2016j/australasia $(BUILD_DIR)/tzdata2016j/backward $(BUILD_DIR)/tzdata2016j/pacificnew $(BUILD_DIR)/tzdata2016j/systemv ; do \
		zic -L /dev/null -d $(ZONEINFO) -y "sh yearistype.sh" $${tz} ; \
		zic -L /dev/null -d $(ZONEINFO)/posix -y "sh yearistype.sh" $${tz} ; \
		zic -L $(BUILD_DIR)/tzdata2016j/leapseconds -d $(ZONEINFO)/right -y "sh yearistype.sh" $${tz} ; \
	done
	@cp -v $(BUILD_DIR)/tzdata2016j/zone.tab $(ZONEINFO)
	@cp -v $(BUILD_DIR)/tzdata2016j/zone1970.tab $(ZONEINFO)
	@cp -v $(BUILD_DIR)/tzdata2016j/iso3166.tab $(ZONEINFO)
	@zic -d $(ZONEINFO) -p America/New_York
	@if ! [ -f $(ROOTFS_DIR)/usr/share/zoneinfo/$(CONFIG_LOCAL_TIMEZONE) ] ; then \
	    echo "Seems like your timezone won't work out. Defaulting to Seoul. Either fix it yourself later or consider moving there." ; \
	    cp -v $(ROOTFS_DIR)/usr/share/zoneinfo/Asia/Seoul $(ROOTFS_DIR)/etc/localtime ; \
	else \
	    cp -v $(ROOTFS_DIR)/usr/share/zoneinfo/$(CONFIG_LOCAL_TIMEZONE) $(ROOTFS_DIR)/etc/localtime ; \
	fi;
	@rm -rf $(BUILD_DIR)/tzdata2016j
	@echo $(NAME) >> $(LOG_DIR)/system.packages
