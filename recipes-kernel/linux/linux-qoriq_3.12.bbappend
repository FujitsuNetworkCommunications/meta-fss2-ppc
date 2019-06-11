
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

SRC_URI += "file://${MACHINE}/dts \
            file://${MACHINE}/kconfig \
            file://netfilter.cfg \
                  "

SRC_URI_append_t600 += "file://patches/0001-Updated-BR_GROUPFWD_RESTRICTED-to-0x0007u.patch \
                        file://${MACHINE}/patches/0001-Backport-PPC64-patch-to-linux-3.12.patch \
                        file://${MACHINE}/patches/0002-Chage-to-fit-T600-NOR-flash-partition.patch \
                        file://${MACHINE}/patches/0003-add-accton-kernel-driver.patch \
                        file://${MACHINE}/patches/0004-update-cpld-fan-and-mdec-driver-base-on-the-new-spec.patch \
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
                        file://${MACHINE}/patches/0020-remove-packet-FCS-4-bytes-come-from-BCM5389.patch           \
                        file://${MACHINE}/patches/0021-add-protection-for-multi-processes-access-the-MDEC.patch    \
                        file://${MACHINE}/patches/0022-fix-2-sfp-bug.patch                                         \
                        file://${MACHINE}/patches/0023-workaround-for-hard-reset-in-R0A-blade.patch                \
                        file://${MACHINE}/patches/0024-add-code-to-find-the-pci-parent-resource.patch              \
                        file://${MACHINE}/patches/0025-remove-retry-messages-while-retrying-i2c-interface.patch    \
                        file://${MACHINE}/patches/0026-support-LM75-on-the-PIU.patch                               \
                        file://${MACHINE}/patches/0027-ACCTON-550-change-udelay-to-usleep-for-improving-the.patch  \
                        file://${MACHINE}/patches/0028-ACCTON-538-Re-PM-validity-of-NW-port-EQPT-PM-is-some.patch  \
                        file://${MACHINE}/patches/0029-ACCTON-379-Blade-cannot-start-up-by-Time-has-been-ch.patch  \
                        file://${MACHINE}/patches/0030-ACCTON-537-OC-Unable-generate-about-PSU-failure-alar.patch  \
                        file://${MACHINE}/patches/0031-support-psu-status-input-byte.patch                         \
                        file://${MACHINE}/patches/0032-ACCTON-683-Remove-Insert-PIU-slot1-or-slot2-doesn-t-.patch  \
                        file://${MACHINE}/patches/0033-support_otp_shutdown_blade.patch                            \
                        file://${MACHINE}/patches/0034-ACCTON-715-IQT-6-PIU-equipmentRemoved-happened-after.patch  \
                        file://${MACHINE}/patches/0035-ACCTON-706-LED-control-does-not-work-on-FAN-slot.patch      \
                        file://${MACHINE}/patches/0036-ACCTON-624-Consider-to-avoid-FPA-python-freeze-probl.patch  \
                        file://${MACHINE}/patches/0037-Because-TCP-need-use-packet-buffer-for-retransmis.patch     \
                        file://${MACHINE}/patches/0038-fix-some-minor-issues.patch                                 \
                        file://${MACHINE}/patches/0039-ACCTON-727-continued-fix-dpa-tx-err-hand.patch              \
                        file://${MACHINE}/patches/0040-ACCTON-727-fix_incomplete_patch-dpa-tx-err-hand-.patch      \
                        file://${MACHINE}/patches/0041-Add-PIU-scan-mutex.-Application-must-use-this-mutex-.patch  \
                        file://${MACHINE}/patches/0042-ACCTON-858-Main-signal-is-down-after-PIU-reseat.patch       \
                        file://patches/0001-powerpc-discard-.exit.data-at-runtime.patch \
                        file://${MACHINE}/patches/0043-ACCTON-996-Too-many-open-files-in-system.patch \
                       "

KERNEL_DEVICETREE = "${MACHINE}.dtb"
KERNEL_DEFCONFIG  = "${WORKDIR}/kconfig/${MACHINE}_config"

# meta-enea is bbappending to this recipe and adding 10+ config fragments.
# Since we currently already include those items in our KERNEL_DEFCONFIG,
# start the list from scratch and add our fragments.
DELTA_KERNEL_DEFCONFIG = "${WORKDIR}/netfilter.cfg"

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

PR := "${PR}.17"
