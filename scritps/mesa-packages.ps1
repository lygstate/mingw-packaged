# make depends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${env:MINGW_PACKAGE_PREFIX}-asciidoc
${env:MINGW_PACKAGE_PREFIX}-cc
${env:MINGW_PACKAGE_PREFIX}-gobject-introspection
${env:MINGW_PACKAGE_PREFIX}-gtk-doc
${env:MINGW_PACKAGE_PREFIX}-luajit
${env:MINGW_PACKAGE_PREFIX}-pkg-config
${env:MINGW_PACKAGE_PREFIX}-ruby
${env:MINGW_PACKAGE_PREFIX}-vala
${env:MINGW_PACKAGE_PREFIX}-meson
${env:MINGW_PACKAGE_PREFIX}-openmp"

# depends
$env:MSYS2_PACKAGES = "$env:MSYS2_PACKAGES
${env:MINGW_PACKAGE_PREFIX}-babl
${env:MINGW_PACKAGE_PREFIX}-cairo
${env:MINGW_PACKAGE_PREFIX}-exiv2
${env:MINGW_PACKAGE_PREFIX}-ffmpeg
${env:MINGW_PACKAGE_PREFIX}-gexiv2
${env:MINGW_PACKAGE_PREFIX}-gcc-libs
${env:MINGW_PACKAGE_PREFIX}-gdk-pixbuf2
${env:MINGW_PACKAGE_PREFIX}-gettext
${env:MINGW_PACKAGE_PREFIX}-glib2
${env:MINGW_PACKAGE_PREFIX}-jasper
${env:MINGW_PACKAGE_PREFIX}-json-glib
${env:MINGW_PACKAGE_PREFIX}-libjpeg
${env:MINGW_PACKAGE_PREFIX}-libpng
${env:MINGW_PACKAGE_PREFIX}-libraw
${env:MINGW_PACKAGE_PREFIX}-librsvg
${env:MINGW_PACKAGE_PREFIX}-libspiro
${env:MINGW_PACKAGE_PREFIX}-libwebp
${env:MINGW_PACKAGE_PREFIX}-lcms
${env:MINGW_PACKAGE_PREFIX}-lensfun
${env:MINGW_PACKAGE_PREFIX}-maxflow
${env:MINGW_PACKAGE_PREFIX}-openexr
${env:MINGW_PACKAGE_PREFIX}-pango
${env:MINGW_PACKAGE_PREFIX}-SDL2
${env:MINGW_PACKAGE_PREFIX}-suitesparse"
