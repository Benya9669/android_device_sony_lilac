### PLATFORM
$(call inherit-product, device/sony/yoshino-common/platform.mk)
### PROPRIETARY VENDOR FILES
$(call inherit-product, vendor/sony/lilac/lilac-vendor.mk)

ifeq ($(WITH_FDROID),true)
$(call inherit-product, vendor/fdroid/fdroid-vendor.mk)
endif
ifeq ($(WITH_MICROG),true)
$(call inherit-product, vendor/microg/microg-vendor.mk)
endif
ifeq ($(WITH_GAPPS),true)
GAPPS_VARIANT := pico
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif
### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/sony/lilac

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(DEVICE_PATH)/overlay/packages/apps/CarrierConfig

ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/device/init.mk
else # WITH_TWRP
include $(DEVICE_PATH)/device/*.mk
include $(DEVICE_PATH)/vendor_prop.mk
endif # WITH_TWRP
