# make depends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${MINGW_PACKAGE_PREFIX}-cc
${MINGW_PACKAGE_PREFIX}-python-mako
${MINGW_PACKAGE_PREFIX}-meson
${MINGW_PACKAGE_PREFIX}-pkg-config
${MINGW_PACKAGE_PREFIX}-libelf"

# depends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${MINGW_PACKAGE_PREFIX}-llvm
${MINGW_PACKAGE_PREFIX}-zlib
${MINGW_PACKAGE_PREFIX}-vulkan-loader
${MINGW_PACKAGE_PREFIX}-libsystre
${MINGW_PACKAGE_PREFIX}-libwinpthread-git
${MINGW_PACKAGE_PREFIX}-zstd"

# optdepends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${MINGW_PACKAGE_PREFIX}-opengl-man-pages
${MINGW_PACKAGE_PREFIX}-vulkan-validation-layers
"
