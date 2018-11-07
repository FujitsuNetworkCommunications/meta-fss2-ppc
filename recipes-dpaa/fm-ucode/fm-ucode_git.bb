DESCRIPTION = "Fman microcode binary"
SECTION = "fm-ucode"
LICENSE = "Freescale-Binary-EULA"
LIC_FILES_CHKSUM = "file://EULA;md5=60037ccba533a5995e8d1a838d85799c"

PR = "r1"

inherit deploy

SRC_URI = "git://github.com/NXP/qoriq-fm-ucode.git;nobranch=1"
SRCREV = "4cda2e3f36408ded79022cf599260add07769786"

S = "${WORKDIR}/git"

REGLEX ?= "${MACHINE}"
REGLEX_t1023 = "t1024"
REGLEX_t1040 = "t1040"
REGLEX_t1042 = "t1040"
REGLEX_b4420 = "b4860"
REGLEX_t4160 = "t4240"
REGLEX_ls1043a = "ls1043"
REGLEX_ls1046a = "ls1046"

#T600 device uses fsl_fman_ucode_t2080_r1.1_106_4_14.bin
do_install () {
    install -d ${D}/boot
    install -m 644 ${B}/fsl_fman_ucode_t2080_r1.1_106_4_14.bin ${D}/boot/
}

do_deploy () {
    install -d ${DEPLOYDIR}/
    install -m 644 ${B}/fsl_fman_ucode_t2080_r1.1_106_4_14.bin ${DEPLOYDIR}
}
addtask deploy before do_build after do_install

PACKAGES += "${PN}-image"
FILES_${PN}-image += "/boot"
ALLOW_EMPTY_${PN} = "1"

COMPATIBLE_MACHINE = "(e500mc|e5500|e5500-64b|e6500|e6500-64b|fsl-lsch2)"
PACKAGE_ARCH = "${MACHINE_ARCH}"

