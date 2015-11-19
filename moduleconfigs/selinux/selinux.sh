SELINUX_MAKE_ARGS="$SELINUX_MAKE_ARGS AR=${GCC_LINUX_GNUEABIHF}ar"
SELINUX_MAKE_ARGS="$SELINUX_MAKE_ARGS AS=${GCC_LINUX_GNUEABIHF}as"
SELINUX_MAKE_ARGS="$SELINUX_MAKE_ARGS CC=${GCC_LINUX_GNUEABIHF}cc"
SELINUX_MAKE_ARGS="$SELINUX_MAKE_ARGS CXX=${GCC_LINUX_GNUEABIHF}g++"

Compile() {
    "$TOP/build/tools/lns" -rf "$MODULE_DIR/libsepol/" "$MODULE_OUT"
    "$MAKEFORWARD" "$EFIDROID_MAKE" -C "$MODULE_OUT/libsepol" $SELINUX_MAKE_ARGS all
}

Clean() {
    "$MAKEFORWARD" "$EFIDROID_MAKE" -C "$MODULE_OUT/libsepol" $SELINUX_MAKE_ARGS clean
}

DistClean() {
    rm -Rf "$MODULE_OUT/"*
}
