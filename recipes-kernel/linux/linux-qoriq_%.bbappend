
REQUIRED_DISTRO_FEATURES_e6500 += "multiarch"

python () {
    pkgarch = d.getVar("TUNE_PKGARCH", True)
    tcmode  = d.getVar("TCMODE", True)
    if not "ppce6500" == pkgarch and not "external-fsl" == tcmode:
        return

    promote_kernel = d.getVar('BUILD_64BIT_KERNEL')
    if promote_kernel == "1":
        d.setVar('KERNEL_CC_append', ' -m64')
        d.setVar('KERNEL_LD_append', ' -melf64ppc')

    error_qa = d.getVar('ERROR_QA', True)
    if 'arch' in error_qa:
        d.setVar('ERROR_QA', error_qa.replace(' arch', ''))
}

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://${MACHINE}/dts                     \
            file://${MACHINE}/kconfig                 \
            file://patches/0001-Backport-PPC64-patch-to-linux-3.12.patch \
            file://patches/0002-Chage-to-fit-T600-NOR-flash-partition.patch \
            file://patches/0003-add-accton-kernel-driver.patch \
                  "

# Example to add T600 patches/uboot env
# SRC_URI_append_t600 += "file://${MACHINE}/patches/0001-L100-PCI-kernel.patch     \
#                         file://${MACHINE}/uboot_scripts/uboot_env_3b11.txt       \
#                         file://${MACHINE}/uboot_scripts/uboot_env_3r11.txt       \
#                         file://${MACHINE}/uboot_scripts/uboot_env_3j11.txt       \
#                         file://${MACHINE}/uboot_scripts/uboot_env_9l14.txt       \
#                         file://${MACHINE}/patches/0001-disableForcedSpeedReduction.patch \
#                    "

KERNEL_DEFCONFIG  = "${WORKDIR}/kconfig/${MACHINE}_config"

# Device tree is todo at this point, picked an existing one to get kernel to compile
# KERNEL_DEVICETREE = "${MACHINE}.dtb"
# KERNEL_DEVICETREE = "t4240emu.dtb"
KERNEL_DEVICETREE = "t2080rdb.dtb t2080rdb-usdpaa.dtb"

# Example syntax to add device tree
# KERNEL_DEVICETREE_t600 = "${MACHINE}.dtb ${MACHINE}-f100.dtb"

# Example syntax to add SCRIPT
# SCRIPT_SOURCE_l100="${WORKDIR}/${MACHINE}/uboot_scripts/l100-b111-hwinit.scrs"


# Example uboot config addition
# UBOOT_CONFIG_t600="${WORKDIR}/${MACHINE}/uboot_scripts/uboot_env_3b11.txt"

inherit deploy

do_compile_append() {
   for f in ${SCRIPT_SOURCE}
   do
      SCRIPT_BINARY_FILE="`basename ${f} .scrs`.scr"
      mkimage -T script -C none -n 'UBoot Init Script' -d ${f} ${WORKDIR}/${SCRIPT_BINARY_FILE}
   done
}

do_deploy_append () {
   for f in ${SCRIPT_SOURCE}
   do
      SCRIPT_BINARY_FILE="`basename ${f} .scrs`.scr"
      install ${S}/../${SCRIPT_BINARY_FILE} ${DEPLOYDIR}/${SCRIPT_BINARY_FILE}
   done
   for f in ${UBOOT_CONFIG}
   do
      CONFIG_INSTALL_FILE="`basename ${f} .txt`.txt"
      install ${S}/../${MACHINE}/uboot_scripts/${CONFIG_INSTALL_FILE} ${DEPLOYDIR}/${CONFIG_INSTALL_FILE}
   done
}

PR := "${PR}.1"
