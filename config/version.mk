CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

FAOSP_BUILD_TYPE ?= COMMUNITY-BUILD

FAOSP_VERSION := FAOSP-$(CURRENT_DEVICE)-OTA-$(FAOSP_BUILD_TYPE)-$(shell date -u +%Y%m%d-%H%M)

# Fork AOSP version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.faosp.version=$(FAOSP_VERSION) \
    ro.faosp.releasetype=$(FAOSP_BUILD_TYPE)
