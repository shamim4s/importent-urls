@echo off

set "shamimdir=C:\Program Files\ESET\shamim"
set "giturl=https://raw.githubusercontent.com/shamim4s/importent-urls/master"

echo Creating folder...
if not exist "%shamimdir%" mkdir "%shamimdir%"

echo Copying nupdown...
curl.exe -L -o "%shamimdir%\nupdown.exe" "%giturl%/nupdown.exe"

echo Copying wget...
curl.exe -L -o "%shamimdir%\wget.exe" "%giturl%/wget.exe"

echo Copying CFG.xml...
curl.exe -L -o "%shamimdir%\CFG.xml" "%giturl%/CFG.xml"


echo Copying EIS.CMD...
curl.exe -L -o "%shamimdir%\EIS.CMD" "%giturl%/EIS.CMD"

echo Copying ehs_nt64.msi...
curl.exe -L -o "%shamimdir%\ehs_nt64.msi" "%giturl%/ehs_nt64.msi"

echo.
echo Starting installation EIS...
msiexec.exe /i "%shamimdir%\ehs_nt64.msi" /qb ADMINCFG="%shamimdir%\CFG.xml" PRODUCTTYPE=eis CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=1 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=1

if errorlevel 1 (
    echo EIS installation failed. Error code: %errorlevel%
    pause
    exit /b %errorlevel%
)

echo EIS installation finished.

echo.
echo EIS.CMD finished.
echo Starting nupdown.exe...
"%shamimdir%\nupdown.exe"

pause