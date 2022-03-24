# Look at  https://www.msys2.org/docs/environments/
# and https://packages.msys2.org/base/mingw-w64-meson

$hash = [ordered]@{
    MINGW64 = "mingw-w64-x86_64";
    UCRT64 = "mingw-w64-ucrt-x86_64";
    CLANG64 = "mingw-w64-clang-x86_64";
    MINGW32 = "mingw-w64-i686";
    CLANG32 = "mingw-w64-clang-i686";
    CLANGARM64 = "mingw-w64-clang-aarch64";
}

$env:MINGW_PACKAGE_PREFIX=$hash["$env:MSYSTEM"]
