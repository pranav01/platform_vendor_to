# Inherit additional stuff
$(call inherit-product, vendor/to/config/common.mk)

# Main Packages
PRODUCT_PACKAGES += \
    Launcher3 \
    LockClock

# OctOs Packages
PRODUCT_PACKAGES += \
    AboutOctOs \
    FileManager

# Wallpapers
PRODUCT_PACKAGES += \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    PhotoTable \
    PhaseBeam \
    BlueBalls

# Busybox
PRODUCT_PACKAGES += \
    Busybox

# Hide layers manager from launcher
PRODUCT_PROPERTY_OVERRIDES += \
    ro.layers.noIcon=noIcon

# Add layers manager app to build
PRODUCT_PACKAGES += \
    LayersManager
