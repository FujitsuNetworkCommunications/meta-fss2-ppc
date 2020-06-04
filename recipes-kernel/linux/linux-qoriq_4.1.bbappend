FILESEXTRAPATHS_prepend := "${THISDIR}/files/${DISTRO_CODENAME}:${THISDIR}/files:"

SRC_URI += "file://${MACHINE}/dts \
            file://${MACHINE}/kconfig \
            file://${MACHINE}/patches/mtdoops.patch  \
            file://patches/0001-4.1-Updated-BR_GROUPFWD_RESTRICTED-to-0x0007u.patch \
            file://patches/0001-powerpc-discard-.exit.data-at-runtime.patch \
            file://netfilter.cfg \
            "

SRC_URI_append_t600 += "file://${MACHINE}/patches/0002-4.1-Chage-to-fit-T600-NOR-flash-partition.patch \
                        file://${MACHINE}/patches/0003-add-accton-kernel-driver.patch \
                        file://${MACHINE}/patches/0004-update-cpld-fan-and-mdec-driver-base-on-the-new-spec.patch  \
                        file://${MACHINE}/patches/0005-4.1-add-brcm-tag-in-TX-remove-brcm-tag-in-RX.patch          \
                        file://${MACHINE}/patches/0006-fix-the-cold-reset-function-with-the-new-SYSTEM-CPLD.patch  \
                        file://${MACHINE}/patches/0007-fix-the-order-of-fan-number-with-the-new-FAN-CPLD.patch     \
                        file://${MACHINE}/patches/0008-update-the-MDEC-control-method-that-provided-by-hott.patch  \
                        file://${MACHINE}/patches/0009-Fix-port1-always-turn-off-issue.-We-make-mistake-whe.patch  \
                        file://${MACHINE}/patches/0010-4.1-support-ps_shutdown.patch                               \
                        file://${MACHINE}/patches/0011-4.1-decrease-Dpaa-MTU-add-BRCM-tag-and-FCS-need-use-1.patch \
                        file://${MACHINE}/patches/0012-4.1-modify-non-linear-sk_buff-append-bytes-in-Head.patch    \
                        file://${MACHINE}/patches/0013-support-fan-controller.patch                                \
                        file://${MACHINE}/patches/0014-add-marvell-phy-driver-for-controlling-the-phy-insid.patch  \
                        file://${MACHINE}/patches/0015-4.1-support-detect-serial-cable-presencs-DCD-bit.patch      \
                        file://${MACHINE}/patches/0016-ACCTON-260-dco-read-value-is-strange.patch                  \
                        file://${MACHINE}/patches/0017-4.1-modify-dpa-RX-TX-to-support-mtu-to-9000.patch           \
                        file://${MACHINE}/patches/0018-4.1-PF-4599-PPP-SYNC-Support.patch                          \
                        file://${MACHINE}/patches/0018-support-get-set-SFP-module-rate-autoneg-duplex-contr.patch  \
                        file://${MACHINE}/patches/0019-support-power-off-function.patch                            \
                        file://${MACHINE}/patches/0020-4.1-remove-packet-FCS-4-bytes-come-from-BCM5389.patch       \
                        file://${MACHINE}/patches/0021-add-protection-for-multi-processes-access-the-MDEC.patch    \
                        file://${MACHINE}/patches/0022-fix-2-sfp-bug.patch                                         \
                        file://${MACHINE}/patches/0023-workaround-for-hard-reset-in-R0A-blade.patch                \
                        file://${MACHINE}/patches/0024-add-code-to-find-the-pci-parent-resource.patch              \
                        file://${MACHINE}/patches/0025-remove-retry-messages-while-retrying-i2c-interface.patch    \
                        file://${MACHINE}/patches/0026-4.1-support-LM75-on-the-PIU.patch                           \
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
                        file://${MACHINE}/patches/0037-4.1-Because-TCP-need-use-packet-buffer-for-retransmi.patch  \
                        file://${MACHINE}/patches/0038-4.1-fix-some-minor-issues.patch                             \
                        file://${MACHINE}/patches/0039-4.1-ACCTON-727-continued-fix-dpa-tx-err-hand.patch          \
                        file://${MACHINE}/patches/0040-4.1-ACCTON-727-fix_incomplete_patch-dpa-tx-err-hand.patch   \
                        file://${MACHINE}/patches/0041-Add-PIU-scan-mutex.-Application-must-use-this-mutex-.patch  \
                        file://${MACHINE}/patches/0001-4.1-Matching-gpio-numbers-to-3.12-kernel.patch              \
                        file://${MACHINE}/patches/0001-4.1-match-3.12-kernel-temperature-sysfs.patch               \
                        file://${MACHINE}/patches/0042-ACCTON-858-Main-signal-is-down-after-PIU-reseat.patch       \
                        file://${MACHINE}/patches/0043-ACCTON-996-Too-many-open-files-in-system.patch              \
                        file://${MACHINE}/patches/0044-4.1-Fan-speed-changes-to-max-automatically.patch            \
                        file://${MACHINE}/patches/0047-Modify-sysfs-interface-from-i2c-device-to-hwmon-clas.patch  \
                        file://${MACHINE}/patches/0047-dpaa-allow-full-mtu-non-imp-ports.patch                     \
                        file://${MACHINE}/patches/0048-Modify-FAN-duty-cycle-algorithm.-We-set-duty-cycle-b.patch  \
                        file://${MACHINE}/patches/0049-Modify-FAN-temperature-algorithm.-If-current-duty-is.patch  \
                        file://${MACHINE}/patches/0050-Modify-default-time-interval-from-3-to-6-seconds.patch      \
                        file://${MACHINE}/patches/0051-Modify-FAN-speed-gradullay-algorithm.-Don-t-check-te.patch  \
                        file://${MACHINE}/patches/0001-4.1-race-condition-in-pci-enable-disable-device.patch       \
                        file://${MACHINE}/patches/0052-Modify-FAN-algorithm.-Don-t-check-FAN-status-in-ther.patch  \
                        file://${MACHINE}/patches/0053-Change-the-code-from-isync-to-asm-volatile-for-memor.patch  \
                        file://${MACHINE}/patches/0053-4.1-T600-3041-FIPS-disable-print-of-keys.patch              \
                        file://${MACHINE}/patches/0054-Send-ATA_CMD_IDLEIMMEDIATE-command-to-sda-when-syste.patch  \
                        file://${MACHINE}/patches/0061-T700-232-leap-year-issue.patch                              \
                        file://${MACHINE}/patches/0062-Add-reset_bt_status-for-T600-reset-button.patch             \
                       "

SRC_URI_append_t650 += "file://${MACHINE}/patches/0002-4.1-Chage-to-fit-T650-NOR-flash-partition.patch \
                        file://${MACHINE}/patches/0003-add-accton-kernel-driver.patch \
                        file://${MACHINE}/patches/0004-update-cpld-fan-and-mdec-driver-base-on-the-new-spec.patch  \
                        file://${MACHINE}/patches/0005-4.1-add-brcm-tag-in-TX-remove-brcm-tag-in-RX.patch          \
                        file://${MACHINE}/patches/0006-fix-the-cold-reset-function-with-the-new-SYSTEM-CPLD.patch  \
                        file://${MACHINE}/patches/0007-fix-the-order-of-fan-number-with-the-new-FAN-CPLD.patch     \
                        file://${MACHINE}/patches/0008-update-the-MDEC-control-method-that-provided-by-hott.patch  \
                        file://${MACHINE}/patches/0009-Fix-port1-always-turn-off-issue.-We-make-mistake-whe.patch  \
                        file://${MACHINE}/patches/0010-4.1-support-ps_shutdown.patch                               \
                        file://${MACHINE}/patches/0011-4.1-decrease-Dpaa-MTU-add-BRCM-tag-and-FCS-need-use-1.patch \
                        file://${MACHINE}/patches/0012-4.1-modify-non-linear-sk_buff-append-bytes-in-Head.patch    \
                        file://${MACHINE}/patches/0013-support-fan-controller.patch                                \
                        file://${MACHINE}/patches/0014-add-marvell-phy-driver-for-controlling-the-phy-insid.patch  \
                        file://${MACHINE}/patches/0015-4.1-support-detect-serial-cable-presencs-DCD-bit.patch      \
                        file://${MACHINE}/patches/0016-ACCTON-260-dco-read-value-is-strange.patch                  \
                        file://${MACHINE}/patches/0017-4.1-modify-dpa-RX-TX-to-support-mtu-to-9000.patch           \
                        file://${MACHINE}/patches/0018-4.1-PF-4599-PPP-SYNC-Support.patch                          \
                        file://${MACHINE}/patches/0018-support-get-set-SFP-module-rate-autoneg-duplex-contr.patch  \
                        file://${MACHINE}/patches/0019-support-power-off-function.patch                            \
                        file://${MACHINE}/patches/0020-4.1-remove-packet-FCS-4-bytes-come-from-BCM5389.patch       \
                        file://${MACHINE}/patches/0021-add-protection-for-multi-processes-access-the-MDEC.patch    \
                        file://${MACHINE}/patches/0022-fix-2-sfp-bug.patch                                         \
                        file://${MACHINE}/patches/0023-dummy-workaround-for-hard-reset-in-R0A-blade.patch          \
                        file://${MACHINE}/patches/0024-add-code-to-find-the-pci-parent-resource.patch              \
                        file://${MACHINE}/patches/0025-remove-retry-messages-while-retrying-i2c-interface.patch    \
                        file://${MACHINE}/patches/0026-4.1-support-LM75-on-the-PIU.patch                           \
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
                        file://${MACHINE}/patches/0037-4.1-Because-TCP-need-use-packet-buffer-for-retransmi.patch  \
                        file://${MACHINE}/patches/0038-4.1-fix-some-minor-issues.patch                             \
                        file://${MACHINE}/patches/0039-4.1-ACCTON-727-continued-fix-dpa-tx-err-hand.patch          \
                        file://${MACHINE}/patches/0040-4.1-ACCTON-727-fix_incomplete_patch-dpa-tx-err-hand.patch   \
                        file://${MACHINE}/patches/0041-Add-PIU-scan-mutex.-Application-must-use-this-mutex-.patch  \
                        file://${MACHINE}/patches/0001-4.1-Matching-gpio-numbers-to-3.12-kernel.patch              \
                        file://${MACHINE}/patches/0001-4.1-match-3.12-kernel-temperature-sysfs.patch               \
                        file://${MACHINE}/patches/0042-ACCTON-858-Main-signal-is-down-after-PIU-reseat.patch       \
                        file://${MACHINE}/patches/0043-ACCTON-996-Too-many-open-files-in-system.patch              \
                        file://${MACHINE}/patches/0044-4.1-Fan-speed-changes-to-max-automatically.patch            \
                        file://${MACHINE}/patches/0045-modify-code-for-the-new-hardware-device-T650.patch          \
                        file://${MACHINE}/patches/0046-support-QSFPDD-EEPROM.patch                                 \
                        file://${MACHINE}/patches/0047-Modify-sysfs-interface-from-i2c-device-to-hwmon-clas.patch  \
                        file://${MACHINE}/patches/0047-dpaa-allow-full-mtu-non-imp-ports.patch                     \
                        file://${MACHINE}/patches/0048-Modify-FAN-duty-cycle-algorithm.-We-set-duty-cycle-b.patch  \
                        file://${MACHINE}/patches/0049-Modify-FAN-temperature-algorithm.-If-current-duty-is.patch  \
                        file://${MACHINE}/patches/0050-Modify-default-time-interval-from-3-to-6-seconds.patch      \
                        file://${MACHINE}/patches/0051-Modify-FAN-speed-gradullay-algorithm.-Don-t-check-te.patch  \
                        file://${MACHINE}/patches/0001-4.1-race-condition-in-pci-enable-disable-device.patch       \
                        file://${MACHINE}/patches/0052-Modify-FAN-algorithm.-Don-t-check-FAN-status-in-ther.patch  \
                        file://${MACHINE}/patches/0053-Change-the-code-from-isync-to-asm-volatile-for-memor.patch  \
                        file://${MACHINE}/patches/0053-4.1-T600-3041-FIPS-disable-print-of-keys.patch              \
                        file://${MACHINE}/patches/0054-Send-ATA_CMD_IDLEIMMEDIATE-command-to-sda-when-syste.patch  \
                       "

SRC_URI_append_t700 += "file://${MACHINE}/patches/0002-4.1-Chage-to-fit-T700-NOR-flash-partition.patch \
                        file://${MACHINE}/patches/0003-v2-add-accton-kernel-driver.patch \
                        file://${MACHINE}/patches/0010-v2-4.1-support-ps_shutdown.patch                            \
                        file://${MACHINE}/patches/0014-v2-add-marvell-phy-driver-for-controlling-the-phy-in.patch  \
                        file://${MACHINE}/patches/0015-4.1-support-detect-serial-cable-presencs-DCD-bit.patch      \
                        file://${MACHINE}/patches/0018-4.1-PF-4599-PPP-SYNC-Support.patch                          \
                        file://${MACHINE}/patches/0026-4.1-support-LM75-on-the-PIU.patch                           \
                        file://${MACHINE}/patches/0029-ACCTON-379-Blade-cannot-start-up-by-Time-has-been-ch.patch  \
                        file://${MACHINE}/patches/0030-v2-ACCTON-537-OC-Unable-generate-about-PSU-failure-a.patch  \
                        file://${MACHINE}/patches/0001-4.1-Matching-gpio-numbers-to-3.12-kernel.patch              \
                        file://${MACHINE}/patches/0001-4.1-match-3.12-kernel-temperature-sysfs.patch               \
                        file://${MACHINE}/patches/0001-4.1-race-condition-in-pci-enable-disable-device.patch       \
                        file://${MACHINE}/patches/0053-4.1-T600-3041-FIPS-disable-print-of-keys.patch              \
                        file://${MACHINE}/patches/0056-mdio-bus-find-by-name.patch                                 \
                        file://${MACHINE}/patches/0058-Modify-blade-reset.patch                                    \
                        file://${MACHINE}/patches/0059-T700-214-Support-T700-FAN-for-kernel-driver.patch           \
                        file://${MACHINE}/patches/0060-Fix-hardware-reset-and-blade-eeprom-issues.patch            \
                        file://${MACHINE}/patches/0061-T700-232-leap-year-issue.patch                              \
                        file://${MACHINE}/patches/0062-Modify-pwm-function-for-T700.patch                          \
                        file://${MACHINE}/patches/0063-Modify-FAN_REG_CONT-index.patch                             \
                        file://${MACHINE}/patches/0064-ACCTONCIS-82-reduce-the-i2c-access-times-during-upda.patch  \
                        file://${MACHINE}/patches/0066-Add-attribute-to-read-reset-button-status.patch             \
                       "


KERNEL_DEFCONFIG  = "${WORKDIR}/${MACHINE}/kconfig/${MACHINE}_config"
KERNEL_DEVICETREE = "${MACHINE}.dtb"

# Freescale kernel recipes do not have concept of KERNEL_FEATURES
# to add pre-defined config fragments to kernel config. Nor does
# it have logic to auto-apply a config snippet with .cfg extension.

# Instead, it has DELTA_KERNEL_DEFCONFIG to apply user defined
# config fragments.
#
# We are adding everything to KERNEL_DEFCONFIG so set to empty
# list to speed up compiles and to prepare for pyro time frame.

# Instructions for making additional config fragments are in
# Yocto's Kernel Development Manual although need minor
# modifications for Freescale kernels.
#
# 1. Unpack linux and create basic config file.
#    $ bitbake virtual/kernel -c configure
# 2. Modify .config as you require.
#    Using Linux's menuconfig TUI: bitbake virtual/kernel -c menuconfig
#    Or hand edit also requires running oldconfig to fill in
#    new dependencies.
#    $ bitbake virtual/kerenl -c devshell
#    (devshell)$ vim .config
#    (devshell)$ make oldconfig
#    (devshell)$ exit
# 3. Create config fragment: bitbake virtual/kernel -c diffconfig
#
# That will create tmp/work/${MACHINE}/linux-qoriq-sdk/${PV}/fragment.cfg.
# Add contents of file to existing fragement file or new file. If new file,
# add to SRC_URI and DELTA_KERNEL_DEFCONFIG variables for pyro and
# KERNEL_FEATURES for daisy.
DELTA_KERNEL_DEFCONFIG = "${WORKDIR}/netfilter.cfg"

do_compile_prepend() {
    cp -rf ${WORKDIR}/${MACHINE}/dts/* ${WORKDIR}/git/arch/${ARCH}/boot/dts/.
    for f in ${SCRIPT_SOURCE}
    do
        SCRIPT_BINARY_FILE="`basename ${f} .scrs`.scr"
        mkimage -T script -C none -n 'UBoot Init Script' -d ${f} ${WORKDIR}/${SCRIPT_BINARY_FILE}
    done
}

do_deploy_prepend() {
    for f in ${SCRIPT_SOURCE}
    do
        SCRIPT_BINARY_FILE="`basename ${f} .scrs`.scr"
        install ${WORKDIR}/${SCRIPT_BINARY_FILE} ${DEPLOYDIR}/${SCRIPT_BINARY_FILE}
    done
    for f in ${UBOOT_CONFIG}
    do
        CONFIG_INSTALL_FILE="`basename ${f} .txt`.txt"
        install ${WORKDIR}/${MACHINE}/uboot_scripts/${CONFIG_INSTALL_FILE} ${DEPLOYDIR}/${CONFIG_INSTALL_FILE}
    done
}

PR := "${PR}.14"
