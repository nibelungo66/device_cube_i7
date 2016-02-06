#
# Copyright (C) 2014 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product,$(SRC_TARGET_DIR)/product/core_64_bit.mk)

# includes the base of Android-x86 platform
$(call inherit-product,device/generic/common/x86.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Overrides
TARGET_KERNEL_CONFIG := cube_x64_defconfig

PRODUCT_NAME := android_x86_64
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := x86_64
PRODUCT_MODEL := Cube i7

PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/init.sh:system/etc/init.sh \
    $(LOCAL_PATH)/files/excluded-input-devices.xml:system/etc/excluded-input-devices.xml \
    $(LOCAL_PATH)/files/modules.blacklist:system/etc/modules.blacklist \
    $(LOCAL_PATH)/files/init.x86.rc:root/init.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/firmware/rtl8723bu_bt.bin:system/lib/firmware/rtlwifi/rtl8723bu_bt.bin \
    $(LOCAL_PATH)/firmware/rtl8723bu_nic.bin:system/lib/firmware/rtlwifi/rtl8723bu_nic.bin \
    $(LOCAL_PATH)/firmware/brcmfmac4356-pcie.txt:system/lib/firmware/brcm/brcmfmac4356-pcie.txt