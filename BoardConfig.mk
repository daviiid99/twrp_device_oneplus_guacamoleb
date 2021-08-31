#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/oneplus/guacamoleb

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := guacamoleb

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3640655872
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115601780736
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# A/B
AB_OTA_UPDATER := true
TW_INCLUDE_REPACKTOOLS := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    vbmeta \
    dtbo 

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 androidboot.usbcontroller=a600000.dwc3 kpti=off androidboot.vbmeta.avb_version=1.0 buildvariant=userdebug
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/oneplus/guacamoleb
TARGET_KERNEL_CONFIG := guacamoleb_defconfig

# Platform
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOARD_PLATFORM_GPU := qcom-adreno640
QCOM_BOARD_PLATFORMS += msmnile

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Show build time on the splash screen
TW_DEVICE_VERSION= by josemi

# Encryption
PLATFORM_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Extras
BOARD_SUPPRESS_SECURE_ERASE := true
TW_USE_LEDS_HAPTICS := true
USE_RECOVERY_INSTALLER := true
RECOVERY_INSTALLER_PATH := device/oneplus/guacamoleb/installer
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_EDL_MODE := true
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
