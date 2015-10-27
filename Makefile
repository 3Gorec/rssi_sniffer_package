include $(TOPDIR)/rules.mk

PKG_NAME:=rssi_sniffer
PKG_RELEASE:=1
PKG_USE_MIPS16:=0
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

 

define Package/rssi_sniffer
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=RSSI Sniffer
	DEPENDS:=+libc +libpthread +lrt +protobuf
endef

 

define Package/rssi_sniffer/description
Aggregate RSSI data from wi-fi traffic.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./rssi_sniffer/* $(PKG_BUILD_DIR)/
endef

define Package/rssi_sniffer/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/$(PKG_NAME) $(1)/bin/
endef

$(eval $(call BuildPackage,rssi_sniffer))
