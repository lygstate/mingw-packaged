$MINGW_PACKAGE_PREFIX=$env:MINGW_PACKAGE_PREFIX

$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${MINGW_PACKAGE_PREFIX}-toolchain
${MINGW_PACKAGE_PREFIX}-pkgconf
${MINGW_PACKAGE_PREFIX}-gdb
${MINGW_PACKAGE_PREFIX}-gdb-multiarch
${MINGW_PACKAGE_PREFIX}-mosquitto
${MINGW_PACKAGE_PREFIX}-clang
${MINGW_PACKAGE_PREFIX}-lld
"