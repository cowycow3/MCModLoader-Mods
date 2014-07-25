export ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = SpeedMod
SpeedMod_FILES = SpeedMod.mm
SpeedMod_INSTALL_PATH = /Library/MCLoader/
SpeedMod_FRAMEWORKS = UIKit
SpeedMod_PRIVATE_FRAMEWORKS = Preferences
SpeedMod_BUNDLE_EXTENSION = mcpemod
SpeedMod_LIBRARIES = MinecraftMod substrate

include $(THEOS_MAKE_PATH)/bundle.mk
