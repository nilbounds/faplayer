
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
ifeq ($(BUILD_WITH_NEON),1)
LOCAL_ARM_NEON := true
endif

LOCAL_MODULE := filesystem_plugin

LOCAL_CFLAGS += \
    -std=c99 \
    -DHAVE_CONFIG_H \
    -DMODULE_STRING=\"filesystem\" \
    -DMODULE_NAME=filesystem

LOCAL_C_INCLUDES += \
    $(VLCROOT)/compat \
    $(VLCROOT) \
    $(VLCROOT)/include \
    $(VLCROOT)/src

LOCAL_SRC_FILES := \
    directory.c \
    file.c \
    fs.c

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
ifeq ($(BUILD_WITH_NEON),1)
LOCAL_ARM_NEON := true
endif

LOCAL_MODULE := access_http_plugin

LOCAL_CFLAGS += \
    -std=c99 \
    -DHAVE_CONFIG_H \
    -DMODULE_STRING=\"access_http\" \
    -DMODULE_NAME=access_http

LOCAL_C_INCLUDES += \
    $(VLCROOT)/compat \
    $(VLCROOT) \
    $(VLCROOT)/include \
    $(VLCROOT)/src

LOCAL_SRC_FILES := \
    http.c

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

include $(call all-makefiles-under,$(LOCAL_PATH))

