@echo off
REM 调用Gcc编译C
REM Created by Yu xiangxin on 2016/4/23
if "%1"=="" exit
if not exist "%1.c" echo File not found!&exit /b 1
gcc -o %1 %1.c
if exist %1.exe %1
exit /b 0