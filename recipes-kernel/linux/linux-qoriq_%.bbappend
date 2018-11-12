
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
                  "

SRC_URI_append_t600 += "file://${MACHINE}/patches/0001-Backport-PPC64-patch-to-linux-3.12.patch     \
                        file://${MACHINE}/patches/0002-Chage-to-fit-T600-NOR-flash-partition.patch  \
                        file://${MACHINE}/patches/0003-add-accton-kernel-driver.patch               \
                        file://${MACHINE}/patches/0004-update-cpld-fan-and-mdec-driver-base-on-the-new-spec.patch  \
                        file://${MACHINE}/patches/0005-add-brcm-tag-in-TX-remove-brcm-tag-in-RX.patch              \
                        file://${MACHINE}/patches/0006-fix-the-cold-reset-function-with-the-new-SYSTEM-CPLD.patch  \
                        file://${MACHINE}/patches/0007-fix-the-order-of-fan-number-with-the-new-FAN-CPLD.patch     \
                        file://${MACHINE}/patches/0008-update-the-MDEC-control-method-that-provided-by-hott.patch  \
                        file://${MACHINE}/patches/0009-Fix-port1-always-turn-off-issue.-We-make-mistake-whe.patch  \
                        file://${MACHINE}/patches/0010-support-ps_shutdown.patch                                   \
                        file://${MACHINE}/patches/0011-decrease-Dpaa-MTU-add-BRCM-tag-and-FCS-need-use-1.patch     \
                        file://${MACHINE}/patches/0012-modify-non-linear-sk_buff-append-bytes-in-Head.patch        \
                        file://${MACHINE}/patches/0013-support-fan-controller.patch                                \
                        file://${MACHINE}/patches/0014-add-marvell-phy-driver-for-controlling-the-phy-insid.patch  \
                        file://${MACHINE}/patches/0015-support-detect-serial-cable-presencs-DCD-bit.patch          \
                        file://${MACHINE}/patches/0016-ACCTON-260-dco-read-value-is-strange.patch                  \
                        file://${MACHINE}/patches/0017-modify-dpa-RX-TX-to-support-mtu-to-9000.patch               \
                        file://${MACHINE}/patches/0018-support-get-set-SFP-module-rate-autoneg-duplex-contr.patch  \
                        file://${MACHINE}/patches/0019-support-power-off-function.patch                            \
                       "

KERNEL_DEFCONFIG  = "${WORKDIR}/kconfig/${MACHINE}_config"

KERNEL_DEVICETREE = "${MACHINE}.dtb"

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
