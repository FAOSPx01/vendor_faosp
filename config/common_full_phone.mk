# Inherit mobile full common FAOSP stuff
$(call inherit-product, vendor/faosp/config/common_mobile_full.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/faosp/config/telephony.mk)
