ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PROPRIETARY_MODULE := true

sourceFiles := \
               cryptfs_hw.c

commonSharedLibraries := \
                        libcutils \
                        libutils \
                        libdl \
                        libhardware
commonIncludes := \
                  hardware/libhardware/include/hardware/

LOCAL_C_INCLUDES := $(commonIncludes)
LOCAL_SRC_FILES := $(sourceFiles)

LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE:= libcryptfs_hw
LOCAL_SHARED_LIBRARIES := $(commonSharedLibraries)

LOCAL_MODULE_OWNER := qcom

ifeq ($(TARGET_INCLUDE_KEYMASTER_PARTITION_CHECK),true)
LOCAL_CFLAGS += -DINCLUDE_KEYMASTER_PARTITION_CHECK
endif

ifeq ($(TARGET_SWV8_DISK_ENCRYPTION),true)
LOCAL_CFLAGS += -DCONFIG_SWV8_DISK_ENCRYPTION
endif

# USE_ICE_FOR_STORAGE_ENCRYPTION would be true in future if
# TARGET_USE_EMMC_USE_ICE is set
ifeq ($(TARGET_USE_UFS_ICE),true)
LOCAL_CFLAGS += -DUSE_ICE_FOR_STORAGE_ENCRYPTION
endif

include $(BUILD_SHARED_LIBRARY)
endif