#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=broadcom-hnd
PKG_VERSION:=0.6250
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Lightsword1942/broadcom-hnd.git


include $(INCLUDE_DIR)/package.mk

define Package/broadcom-hnd/Default
  SECTION:=kernel
  CATEGORY:=Kernel modules
  DEPENDS:=@PACKAGE_kmod-brcm-hnd
  SUBMENU:=Proprietary BCM47xx HND driver set for Netgear r6250
  SUBMENUDEP:=@TARGET_brcm53xx
endef

define KernelPackage/brcm-hnd/Default
  $(call Package/broadcom-hnd/Default)
  SECTION:=kernel
  DEPENDS:=@TARGET_brcm53xx||TARGET_brcm63xx +wireless-tools
  TITLE:=Broadcom Device Specific Networking Packages
  FILES:=$(PKG_BUILD_DIR)/driver$(1)/wl.ko
  AUTOLOAD:=$(call AutoLoad,30,wl_glue wl)
endef

define KernelPackage/brcm-hnd/Default/description
 This package contains the proprietary wireless driver for the Broadcom 
 BCM47xx chipset.
endef

define KernelPackage/brcm-hnd
$(call KernelPackage/brcm-hnd/Default,)
  TITLE+= (normal version)
endef

define KernelPackage/brcm-hnd/description
$(call KernelPackage/brcm-hnd/Default/description)
endef

define Package/hnd
$(call Package/broadcom-hnd/Default)
  TITLE:=Proprietary Broadcom hnd driver config utility
endef

define Package/hnd/description
 This package contains the proprietary utility (hnd) for configuring the 
 proprietary Broadcom hnd driver.
endef

MAKE_KMOD := $(MAKE) -C "$(LINUX_DIR)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH="$(LINUX_KARCH)" \
		PATH="$(TARGET_PATH)" \
		SUBDIRS="$(PKG_BUILD_DIR)/kmod" \

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(PKG_BUILD_DIR)/driver $(PKG_BUILD_DIR)/driver-mini
	$(CP) ./src/glue $(PKG_BUILD_DIR)/glue
endef

define Build/Compile
	# Compile the kernel part
	$(MAKE_KMOD) \
		SUBDIRS="$(PKG_BUILD_DIR)/driver" \
		MODFLAGS="-DMODULE -mlong-calls" \
		modules

	$(MAKE_KMOD) \
		SUBDIRS="$(PKG_BUILD_DIR)/driver-mini" \
		MODFLAGS="-DMODULE -mlong-calls" \
		BUILD_TYPE="wl_apsta_mini" \
		modules

	# Compile glue driver
	$(MAKE_KMOD) -C "$(LINUX_DIR)" \
		SUBDIRS="$(PKG_BUILD_DIR)/glue" \
		modules                                        

	# Compile libshared
	$(MAKE) -C $(PKG_BUILD_DIR)/shared \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I. -I$(PKG_BUILD_DIR)/driver/include" \
		all

	$(TARGET_CC) -o $(PKG_BUILD_DIR)/wlc \
		-I$(PKG_BUILD_DIR)/shared -I$(PKG_BUILD_DIR)/driver/include \
		./src/wlc.c $(PKG_BUILD_DIR)/shared/libshared.a

	$(TARGET_CC) -o $(PKG_BUILD_DIR)/nas \
		$(PKG_BUILD_DIR)/nas_exe.o \
		$(PKG_BUILD_DIR)/shared/libshared.a

	$(TARGET_CC) -o $(PKG_BUILD_DIR)/wl \
		$(PKG_BUILD_DIR)/wl_exe.o \
		$(PKG_BUILD_DIR)/shared/libshared.a
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/shared/libshared.a $(1)/usr/lib/
endef

define Package/wlc/install
	$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wlc $(1)/sbin/
endef

define Package/wlc/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || /etc/init.d/wlunbind enable || true
endef

define Package/wl/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wl $(1)/usr/sbin/
endef

define Package/nas/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nas $(1)/usr/sbin/
	ln -sf nas $(1)/usr/sbin/nas4not
	ln -sf nas $(1)/usr/sbin/nas4wds
endef

$(eval $(call KernelPackage,brcm-hnd))
$(eval $(call BuildPackage,hnd))
