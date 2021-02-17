@echo off&setlocal enabledelayedexpansion
title 需要配置目标package,编辑进入;乱码请以ANSI重新编码
REM *  
REM * 轻量级android data/data/package文件操作
REM * Created by yu on 2016/05/15
REM * 乱码请以ANSI重新编码
::*************************配置项*****************
::配置目标package data
set package=/sdcard/wowoFolder/apilog/databases
::设置导出文件目录^(可不设置,若默认不可用,则会使用当前目录^)
set output=C:\Users\Administrator\Desktop
::************************************************
if not exist %output% set output=%cd%
set workDir=%temp%\adb1103
set fsfname=lsfile.ini
set lsfile=%workDir%\%fsfname%

set LIST_FILE=可导出文件
set LIST_DIR=可导入的目录
set LIST_DEVICES=可连接的设备
set RETURN_ERROR=echo 设备不可用,按任意键退出
set IMPORT_MESSAGE=把要导入的文件拖拽至此处^(不能有特殊符号和中文^)
if not exist %workDir% mkdir %workDir%
if exist %lsfile% del /q %lsfile%

echo 正在连接设备...
for /f  "skip=1 delims=:"  %%i in ('adb devices') do echo %%i| findstr "device" >>%lsfile%
(forfiles /p %workDir% /m %fsfname% /c "cmd /c if @fsize lss 1 del /q %fsfname%") 1>nul 2>nul
if not exist %lsfile% (%RETURN_ERROR%&pause>nul&exit)
call :select getDevices %LIST_DEVICES%
for /f %%i in ("%getDevices%") do set selectDevices=%%i

:main
cls
echo 连接设备:%selectDevices%
echo 输出目录:%output%
echo 目标包名:%package%
echo 1.打印.xml文件
echo 2.导出.db文件
echo 3.导出文件
echo 4.导入文件
echo 5.删除文件
echo 6.删除缓存
echo 7.清除数据
choice /c 12345 /n
goto :ff%ERRORLEVEL%

:ff1 (打印.xml文件)
call :getSelect xml file %LIST_FILE%
echo 打印文件:%file%
adb -s %selectDevices% shell cat %file%
echo -------------------end---------------
pause&goto:main

:ff2 (导出.db文件)
call :getSelect db file %LIST_FILE%
echo 导出文件:%file%
adb -s %selectDevices%  pull %file% %output%
pause&goto:main

:ff3 (导出文件)
adb -s %selectDevices%  shell find %package% -type f >%lsfile%
call :select file %LIST_FILE%
echo 导出文件:%file%
adb -s %selectDevices%  pull %file% %output%
pause&goto:main

:ff4 (导入文件)
adb -s %selectDevices%  shell find %package% -type d >%lsfile%
call :select selectdir %LIST_DIR%
set /p file=%IMPORT_MESSAGE%
adb -s %selectDevices%  push %file% %selectdir%
pause&goto:main

:ff5 (删除文件)
set /p filter=文件后缀
if "%filter%"=="" (
	set resilt=""
) else (
	set resilt=-name *.%filter%
)
adb -s %selectDevices%  shell find %package% -type f %resilt% >%lsfile%
set filter=
call :select file %LIST_FILE%
echo 删除文件:%file%
adb root
adb remount
adb -s %selectDevices% shell rm -f %file% %output%
pause&goto:main

:ff6 (清除缓存)
echo 暂时实现
pause&goto:main
:ff7 (清除数据)
adb -s %selectDevices% shell pm clear %package%
pause&goto:main
:getSelect
adb -s %selectDevices%  shell find %package% -type f -name '*.%1' >%lsfile%
call :select %2 %3&goto :eof

:select
echo -----------------列表------------------
type %lsfile%|findstr /n "."
echo ---------------------------------------
for /f "tokens=1" %%i in ('type %lsfile%^|find /v "" /c') do set /a rows=%%i
(for /l %%i in (1,1,%rows%) do set /p row%%i=)<%lsfile%
if  "%rows%"=="0" (
	echo 没有文件&pause&goto:main
)
if "%rows%"=="1" (
	set sel=1
) else (
	echo 存在多个%2,请选择^(a=10,b=11...^)
	choice /c 123456789abcdefghijklmn /n
	set sel=!ERRORLEVEL!
)
set %1=!row%sel%!&goto :eof