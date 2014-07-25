export ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = TooManyItems
SuperJump_FILES = SuperJump.mm
SuperJump_INSTALL_PATH = /Library/MCLoader/
SuperJump_FRAMEWORKS = UIKit
SuperJump_PRIVATE_FRAMEWORKS = Preferences
SuperJump_BUNDLE_EXTENSION = mcpemod
SuperJump_LIBRARIES = MinecraftMod substrate

include $(THEOS_MAKE_PATH)/bundle.mk
