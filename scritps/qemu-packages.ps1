$MINGW_PACKAGE_PREFIX=$env:MINGW_PACKAGE_PREFIX

$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
diffutils git grep make sed
${MINGW_PACKAGE_PREFIX}-python
${MINGW_PACKAGE_PREFIX}-python-sphinx
${MINGW_PACKAGE_PREFIX}-toolchain
${MINGW_PACKAGE_PREFIX}-pkgconf
${MINGW_PACKAGE_PREFIX}-SDL2
${MINGW_PACKAGE_PREFIX}-SDL2_image
${MINGW_PACKAGE_PREFIX}-spice
${MINGW_PACKAGE_PREFIX}-spice-gtk
${MINGW_PACKAGE_PREFIX}-gtk3
${MINGW_PACKAGE_PREFIX}-glib2
${MINGW_PACKAGE_PREFIX}-ninja
${MINGW_PACKAGE_PREFIX}-jemalloc
${MINGW_PACKAGE_PREFIX}-lzo2
${MINGW_PACKAGE_PREFIX}-zstd
${MINGW_PACKAGE_PREFIX}-libjpeg-turbo
${MINGW_PACKAGE_PREFIX}-pixman
${MINGW_PACKAGE_PREFIX}-libgcrypt
${MINGW_PACKAGE_PREFIX}-libpng
${MINGW_PACKAGE_PREFIX}-libssh
${MINGW_PACKAGE_PREFIX}-libxml2
${MINGW_PACKAGE_PREFIX}-snappy
${MINGW_PACKAGE_PREFIX}-libusb
${MINGW_PACKAGE_PREFIX}-usbredir
${MINGW_PACKAGE_PREFIX}-libtasn1
${MINGW_PACKAGE_PREFIX}-nettle
${MINGW_PACKAGE_PREFIX}-cyrus-sasl
${MINGW_PACKAGE_PREFIX}-curl
${MINGW_PACKAGE_PREFIX}-gnutls
${MINGW_PACKAGE_PREFIX}-libnfs
"