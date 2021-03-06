# Default toolchains
TARGET_GCC_VERSION_AND := 4.9
TARGET_GCC_VERSION_ARM := 4.9

# Include OctOS bootanimation
include vendor/to/config/bootanimation.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=0 \
    persist.debug.wfd.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0

# init.d support
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/to/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# init file
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/etc/init.local.rc:root/init.local.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

#SuperSU
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/supersu/supersu.zip:supersu/supersu.zip \
    vendor/to/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/bin/sysinit:system/bin/sysinit

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/to/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/to/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/to/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/to/overlay/common

# Include OctOS versioning
include vendor/to/config/to_versioning.mk
