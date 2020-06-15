ARCHS = arm64 arm64e

export SDKVERSION = 13.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hv

HV_FILES = HV.xm
HV_CFLAGS = -fobjc-arc
HV_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

include $(THEOS_MAKE_PATH)/aggregate.mk
