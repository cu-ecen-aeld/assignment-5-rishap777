
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 'b5a76401cd26582eba664d9bb1c43cbfef73e2df'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-rishap777.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS += misc-modules
LDD_MODULE_SUBDIRS += scull


$(eval $(kernel-module))

define LDD_BUILD_CMDS
	$(MAKE) -C $(@D) SUBDIRS=$(LDD_MODULE_SUBDIRS)
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_POST_BUILD
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	
endef

LDD_POST_BUILD_HOOKS += LDD_POST_BUILD


$(eval $(generic-package))
