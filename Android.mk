ifeq ($(TARGET_QCOM_MEDIA_VARIANT),caf-bfam)
QCOM_MEDIA_ROOT := $(call my-dir)
MSM_VIDC_TARGET_LIST := msm8974 msm8610 msm8226 apq8084 msm8916 msm8994 msm8909
$(warning target list is : $(MSM_VIDC_TARGET_LIST))

#Compile these for all targets under QCOM_BOARD_PLATFORMS list.
ifeq ($(call is-board-platform-in-list, $(QCOM_BOARD_PLATFORMS)),true)
include $(QCOM_MEDIA_ROOT)/mm-core/Android.mk
include $(QCOM_MEDIA_ROOT)/libstagefrighthw/Android.mk
endif

ifeq ($(call is-board-platform-in-list, $(MSM_VIDC_TARGET_LIST)),true)
include $(QCOM_MEDIA_ROOT)/mm-video-v4l2/Android.mk
include $(QCOM_MEDIA_ROOT)/libc2dcolorconvert/Android.mk

ifeq ($(TARGET_BOARD_PLATFORM),apq8084)
include $(QCOM_MEDIA_ROOT)/videopp/Android.mk
endif
endif
endif
