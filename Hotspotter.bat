@echo off
color 0a
: top
mode con: cols=60 lines=20
title Laptop HotSpotter
echo ===========================================================
echo ^ ^ ^ ^ ^ ^ ^ ^ ^Turn Your Laptop Into A Hotspot In Seconds
echo ===========================================================
echo.
goto menu
: setup
cls
title Setup New Hotspot
echo ===========================================================
echo ^ ^ ^ ^ ^ ^ ^ ^ ^Turn Your Laptop Into A Hotspot In Seconds
echo ===========================================================
echo.
set /p ssid=Hotspot Name (SSID): 
echo.
set /p pass=Hotspot Password:
echo.
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%pass%
pause
cls
goto top

: start
echo.
netsh wlan start hostednetwork
pause
cls
goto top

: stop
echo.
netsh wlan stop hostednetwork
pause
cls
goto top

: menu
SETLOCAL ENABLEDELAYEDEXPANSION
echo Please Select an Option: 
echo.
echo 0. Check If Hostednetwork Is Supported
echo.
echo 1. Setup New Hotspot
echo.
echo 2. Start Hotspot
echo.
echo 3. Stop Hotspot
echo.
echo.
set /p op=Option:
IF "%op%" == "0" GOTO hostednetwork
IF "%op%"  == "view" GOTO view
IF "%op%" == "1" GOTO setup
IF "%op%"  == "2" GOTO start
IF "%op%"  == "3" GOTO stop
IF not "%op%"  == "0" IF not "%op%"  == "1" IF not "%op%"  == "2" IF not "%op%"  == "3" GOTO error
IF not "%op%" == "view" GOTO error
echo.	

: view
cls
title Hosted Network Settings
netsh wlan show hostednetwork
pause
cls
goto top

: hostednetwork
title Wlan Drivers
mode con: cols=75 lines=55
netsh wlan show drivers
pause
cls
goto top

: error
echo.
title Error!
echo Try Again
echo Option "%op%" is invalid. Select either option 0, 1, 2 or 3.
echo Other Commands: view (all lowercase)
echo.
pause
cls
goto top
