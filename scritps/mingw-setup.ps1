$env:MSYS = "winsymlinks:nativestrict"
$env:MSYS2_FINGERPRINT = "0"
$env:MSYS2_URL = "https://github.com/msys2/msys2-installer/releases/download/2024-05-07/msys2-base-x86_64-20240507.sfx.exe"

$env:MSYS2_PACKAGES = ""
$env:MESA_PACKAGES = ""

#$env:MSYSTEM="MINGW32"
#& "$PSScriptRoot\msys2-prepare.ps1"
#& "$PSScriptRoot\qemu-packages.ps1"
#& "$PSScriptRoot\mesa-packages.ps1"
#& "$PSScriptRoot\extra-packages.ps1"

$env:MSYSTEM="MINGW64"
& "$PSScriptRoot\msys2-prepare.ps1"
& "$PSScriptRoot\qemu-packages.ps1"
& "$PSScriptRoot\mesa-packages.ps1"
& "$PSScriptRoot\extra-packages.ps1"

#$env:MSYSTEM="UCRT64"
#& "$PSScriptRoot\msys2-prepare.ps1"
#& "$PSScriptRoot\qemu-packages.ps1"
#& "$PSScriptRoot\mesa-packages.ps1"
#& "$PSScriptRoot\extra-packages.ps1"

#$env:MSYSTEM="CLANG64"
#& "$PSScriptRoot\msys2-prepare.ps1"
#& "$PSScriptRoot\qemu-packages.ps1"
#& "$PSScriptRoot\mesa-packages.ps1"
#& "$PSScriptRoot\extra-packages.ps1"

#$env:MSYSTEM="CLANG32"
#& "$PSScriptRoot\msys2-prepare.ps1"
#& "$PSScriptRoot\qemu-packages.ps1"
#& "$PSScriptRoot\mesa-packages.ps1"
#& "$PSScriptRoot\extra-packages.ps1"

# Normalize the packages
$env:MSYS2_PACKAGES = ($env:MSYS2_PACKAGES) -split '\r?\n' -gt 0 -join ' '
$env:MESA_PACKAGES = ($env:MESA_PACKAGES) -split '\r?\n' -gt 0 -join ' '
Write-Output $env:MSYS2_PACKAGES
Write-Output $env:MSYS2_URL
Write-Output fingerprint:$env:MSYS2_FINGERPRINT

Remove-Item -Force -ErrorAction SilentlyContinue -Recurse C:\tools\archive

# Downloading msys2 installer as C:\tools\archive\base.exe
mkdir -Force C:\tools\archive
$start_time = Get-Date
curl.exe --output C:\tools\archive\base.exe -LJO $env:MSYS2_URL
Write-Output "Download time taken: $((Get-Date).Subtract($start_time))"

# Install msys64 to C:\tools\msys64
Set-Location C:\tools
Remove-Item -Force -ErrorAction SilentlyContinue -Recurse C:\tools\msys64
C:\tools\archive\base.exe -y
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\archive\base.exe
Write-Output "Base install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date

Remove-Item -Force -ErrorAction SilentlyContinue -Recurse C:\tools\msys64\var\cache\pacman\pkg
Move-Item C:\tools\pkg C:\tools\msys64\var\cache\pacman\pkg

$env:MSYSTEM="MSYS"
((Get-Content -path C:\tools\msys64\etc\\post-install\\07-pacman-key.post -Raw) -replace '--refresh-keys', '--version') | Set-Content -Path C:\tools\msys64\etc\\post-install\\07-pacman-key.post
C:\tools\msys64\usr\bin\bash.exe -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
C:\tools\msys64\usr\bin\bash.exe -lc "export"

Write-Output "Update mirrorlist 1"
Copy-Item -Path $PSScriptRoot\..\etc\pacman.d\mirrorlist.* -Destination C:\tools\msys64\etc\pacman.d\

C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Sy
Write-Output Y | C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Suu --overwrite=*
taskkill /F /FI "MODULES eq msys-2.0.dll"
tasklist

Write-Output "Update mirrorlist 2"
Copy-Item -Path $PSScriptRoot\..\etc\pacman.d\mirrorlist.* -Destination C:\tools\msys64\etc\pacman.d\

C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date

Write-Output "Update mirrorlist 3"
Copy-Item -Path $PSScriptRoot\..\etc\pacman.d\mirrorlist.* -Destination C:\tools\msys64\etc\pacman.d\

C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MESA_PACKAGES"
Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date

C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MSYS2_PACKAGES"
Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date


Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\etc\mtab
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\fd
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stderr
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdin
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdout

Remove-Item -Force -ErrorAction SilentlyContinue -Recurse C:\tools\pkg
Move-Item C:\tools\msys64\var\cache\pacman\pkg C:\tools\pkg
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\archive\msys64.tar
tar cf C:\tools\archive\msys64.tar -C C:\tools\ msys64

Write-Output "Package archive time taken: $((Get-Date).Subtract($start_time))"
