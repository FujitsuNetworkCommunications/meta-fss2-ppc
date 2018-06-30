FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
PR := "${PR}.1"
SRCREV_t600 = "3e89f378ed70e9b856756de8c3dbdfccb045fa0c"
SRC_URI += "file://0001-Add-Fujitsu-T600-RCW-binary-image-this-bin-file-rela.patch\
            file://0002-update-for-fixing-incorrect-I2C-bus-setting.patch "

do_install_t600 () {
        make install

        M=`echo ${MACHINE} | sed s/-64b//g`
        install -d ${D}/boot/rcw
	# FIXME: To be developed
        #cp -r ${S}/${M}/${M}/* ${D}/boot/rcw
}

do_deploy_t600 () {
        M=`echo ${MACHINE} | sed s/-64b//g`
        install -d ${DEPLOYDIR}/rcw
	# FIXME: To be developed
        #cp -r ${S}/${M}/${M}/* ${DEPLOYDIR}/rcw
}

