@echo off
setlocal

set "SCRIPT=%TEMP%\my-script.cmd"
set "URL=https://raw.githubusercontent.com/shamim4s/importent-urls/master/script.cmd"

powershell -NoProfile -Command ^
  "$p='%SCRIPT%'; Invoke-WebRequest -Uri '%URL%' -OutFile $p; Start-Process cmd.exe -Verb RunAs -ArgumentList '/c ""'+$p+'""' -Wait"

del "%SCRIPT%" 2>nul
endlocal