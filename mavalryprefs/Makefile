ARCHS = arm64 arm64e

export SDKVERSION = 13.4

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = mavalryprefs

mavalryprefs_FILES = BRUHRootListController.m BRUHRootHeaderView.mm BRUHSubtitleCell.m
mavalryprefs_INSTALL_PATH = /Library/PreferenceBundles
mavalryprefs_FRAMEWORKS = UIKit
mavalryprefs_PRIVATE_FRAMEWORKS = Preferences OnBoardingKit
mavalryprefs_CFLAGS = -fobjc-arc


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/mavalryprefs.plist$(ECHO_END)