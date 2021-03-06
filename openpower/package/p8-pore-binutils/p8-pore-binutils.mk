################################################################################
#
# p8-pore-binutils
#
################################################################################

P8_PORE_BINUTILS_VERSION ?= dcf4f87c0d9e8c8092ace0eb696189ee1056da30
P8_PORE_BINUTILS_SITE ?= $(call github,open-power,p8-pore-binutils,$(P8_PORE_BINUTILS_VERSION))
P8_PORE_BINUTILS_LICENSE = GPLv3+

HOST_P8_PORE_BINUTILS_DEPENDENCIES = host-binutils

P8_PORE_BINUTILS_DIR = $(STAGING_DIR)/p8-pore-binutils
P8_PORE_BINUTILS_BIN = $(STAGING_DIR)/p8-pore-binutils/linux

define HOST_P8_PORE_BINUTILS_BUILD_CMDS
        cd $(@D) && \
        ./configure --prefix=$(P8_PORE_BINUTILS_DIR) \
                    --exec-prefix=$(P8_PORE_BINUTILS_BIN) \
                    --target=pore-elf64 && \
        make configure-host && \
        make LDFLAGS=-all-static
endef

define HOST_P8_PORE_BINUTILS_INSTALL_CMDS
        bash -c 'cd $(@D) && make install'
endef

$(eval $(host-generic-package))
