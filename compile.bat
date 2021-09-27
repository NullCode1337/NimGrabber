@echo off & title NimGrabber Compiler & cls & color 2
echo  _______  .__          ________            ___.  ___.                 
echo  \      ^\ ^|__^| _____  /  _____/___________ ^\_ ^|__^\_ ^|__   ___________ 
echo  /   ^|   \^|  ^|/     ^\/   ^\  __^\_  __ ^\__  ^\ ^| __ \^| __ ^\_/ __ \_  __ \
echo /    ^|    \  ^|       \    \_\  \  ^| ^\// __ \^| \_\ \ \_\ \  ___/^|  ^| \/
echo ^\____^|__  ^/__^|__^|_^|  ^/^\______  ^/__^|  ^(____  ^/___  ^/___  ^/^\___  ^>__^|   
echo         \/         \/        \/           \/    \/    \/     \/       
echo                Discord Token Grabber written in Nim & echo.

choice /C YN /N /M "Do you have dependencies installed? [Y/N]"
if %errorlevel%==1 (goto compile)
if %errorlevel%==2 (goto install_dep)

:install_dep
echo. & echo [INFO] Installing dependencies...
nimble install puppy
nimble install regex

:compile
echo [INFO] Compiling the exe...
nim c -d:danger --gc:arc -d:useMalloc --panics:on <file>.nim
