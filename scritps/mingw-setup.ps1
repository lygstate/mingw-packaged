$env:MSYSTEM="MINGW64"
./msys2-prepare.ps1
./qemu-packages.ps1
./mesa-packages.ps1
$env:MSYS2_PACKAGES = ($env:MSYS2_PACKAGES) -split '\r?\n' -gt 0 -join ' '

Write-Output $env:MSYS2_PACKAGES
Write-Output $env:MSYS2_URL
Write-Output fingerprint:$env:MSYS2_FINGERPRINT

mkdir -Force C:\tools\archive\pkg
$start_time = Get-Date
bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND $env:MSYS2_URL C:\tools\archive\base.exe
Write-Output "Download time taken: $((Get-Date).Subtract($start_time))"
Set-Location C:\tools
C:\tools\archive\base.exe -y
Remove-Item -Force C:\tools\archive\base.exe
Write-Output "Base install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date

((Get-Content -path C:\tools\msys64\etc\\post-install\\07-pacman-key.post -Raw) -replace '--refresh-keys', '--version') | Set-Content -Path C:\tools\msys64\etc\\post-install\\07-pacman-key.post
C:\tools\msys64\usr\bin\bash.exe -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
C:\tools\msys64\usr\bin\bash.exe -lc "export"
C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Sy
Write-Output Y | C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Suu --overwrite=*
taskkill /F /FI "MODULES eq msys-2.0.dll"
tasklist
C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date

C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MSYS2_PACKAGES"
Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
$start_time = Get-Date

Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\etc\mtab
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\fd
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stderr
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdin
Remove-Item -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdout
Remove-Item -Force -Recurse -ErrorAction SilentlyContinue C:\tools\msys64\var\cache\pacman\pkg
tar cf C:\tools\archive\msys64.tar -C C:\tools\ msys64

Write-Output "Package archive time taken: $((Get-Date).Subtract($start_time))"
Remove-Itemdel -Force -Recurse -ErrorAction SilentlyContinue c:\tools\msys64
