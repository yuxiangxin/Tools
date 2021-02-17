@echo off
REM 获取ndk platforms 的路径,默认版本为8
REM Created by Yu xiangxin on 2016/5/23
set var=8
if not "%1"=="" set var=%1 
set /p=C:\MySoftWare\Work\android-ndk-r9b\platforms\android-%var% 0<nul|clip
exit /b 0
