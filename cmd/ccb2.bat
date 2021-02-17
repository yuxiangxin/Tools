@echo off
set inparams=%1
if "%inparams%"=="" set /p=params:
if not exist "%inparams%.c" echo File not found!&exit /b 1
gcc -o %inparams% %inparams%.c
if exist %inparams%.exe %inparams%
exit /b 0