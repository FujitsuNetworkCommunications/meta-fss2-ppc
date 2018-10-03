FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append += "file://${MACHINE}/dts                     \
                   file://${MACHINE}/kconfig                 \
                   "

# Example to add T600 patches/uboot env
# SRC_URI_append_t600 += "file://${MACHINE}/patches/0001-L100-PCI-kernel.patch     \
#                         file://${MACHINE}/uboot_scripts/uboot_env_3b11.txt       \
#                         file://${MACHINE}/uboot_scripts/uboot_env_3r11.txt       \
#                         file://${MACHINE}/uboot_scripts/uboot_env_3j11.txt       \
#                         file://${MACHINE}/uboot_scripts/uboot_env_9l14.txt       \
#                         file://${MACHINE}/patches/0001-disableForcedSpeedReduction.patch \
#                    "

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
                       "
                       

KERNEL_DEFCONFIG  = "../kconfig/${MACHINE}_config"

# Device tree is todo at this point, picked an existing one to get kernel to compile
KERNEL_DEVICETREE = "${MACHINE}.dtb"
# KERNEL_DEVICETREE = "t4240emu.dtb"
#KERNEL_DEVICETREE = "t2080rdb.dtb t2080rdb-usdpaa.dtb"

# Example syntax to add device tree
# KERNEL_DEVICETREE_t600 = "${MACHINE}.dtb ${MACHINE}-f100.dtb"

# Example syntax to add SCRIPT
# SCRIPT_SOURCE_l100="${WORKDIR}/${MACHINE}/uboot_scripts/l100-b111-hwinit.scrs"


# Example uboot config addition
# UBOOT_CONFIG_t600="${WORKDIR}/${MACHINE}/uboot_scripts/uboot_env_3b11.txt"

inherit deploy

# do_install_prepend() {
#  	cp -rf ${WORKDIR}/dts/* ${WORKDIR}/git/arch/${ARCH}/boot/dts/.
# }

configure_kernel() {
  cp ${WORKDIR}/kconfig/${KERNEL_DEFCONFIG} ${B}/.config
  cp ${WORKDIR}/kconfig/${KERNEL_DEFCONFIG} ${B}/.config.ori
  oe_runmake oldconfig
}

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

#addtask mkubootscr after do_compile before do_install              

PR := "${PR}.10"
