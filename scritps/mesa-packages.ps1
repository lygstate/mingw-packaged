# make depends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${env:MINGW_PACKAGE_PREFIX}-cc
${env:MINGW_PACKAGE_PREFIX}-python-mako
${env:MINGW_PACKAGE_PREFIX}-meson
${env:MINGW_PACKAGE_PREFIX}-pkgconf
${env:MINGW_PACKAGE_PREFIX}-libelf"

# depends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${env:MINGW_PACKAGE_PREFIX}-llvm
${env:MINGW_PACKAGE_PREFIX}-zlib
${env:MINGW_PACKAGE_PREFIX}-vulkan-loader
${env:MINGW_PACKAGE_PREFIX}-libsystre
${env:MINGW_PACKAGE_PREFIX}-libwinpthread-git
${env:MINGW_PACKAGE_PREFIX}-zstd"

# optdepends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${env:MINGW_PACKAGE_PREFIX}-opengl-man-pages
${env:MINGW_PACKAGE_PREFIX}-vulkan-validation-layers
"
