@echo off&setlocal enabledelayedexpansion
title ��Ҫ����Ŀ��package,�༭����;��������ANSI���±���
REM *  
REM * ������android data/data/package�ļ�����
REM * Created by yu on 2016/05/15
REM * ��������ANSI���±���
::*************************������*****************
::����Ŀ��package data
set package=/sdcard/wowoFolder/apilog/databases
::���õ����ļ�Ŀ¼^(�ɲ�����,��Ĭ�ϲ�����,���ʹ�õ�ǰĿ¼^)
set output=C:\Users\Administrator\Desktop
::************************************************
if not exist %output% set output=%cd%
set workDir=%temp%\adb1103
set fsfname=lsfile.ini
set lsfile=%workDir%\%fsfname%

set LIST_FILE=�ɵ����ļ�
set LIST_DIR=�ɵ����Ŀ¼
set LIST_DEVICES=�����ӵ��豸
set RETURN_ERROR=echo �豸������,��������˳�
set IMPORT_MESSAGE=��Ҫ������ļ���ק���˴�^(������������ź�����^)
if not exist %workDir% mkdir %workDir%
if exist %lsfile% del /q %lsfile%

echo ���������豸...
for /f  "skip=1 delims=:"  %%i in ('adb devices') do echo %%i| findstr "device" >>%lsfile%
(forfiles /p %workDir% /m %fsfname% /c "cmd /c if @fsize lss 1 del /q %fsfname%") 1>nul 2>nul
if not exist %lsfile% (%RETURN_ERROR%&pause>nul&exit)
call :select getDevices %LIST_DEVICES%
for /f %%i in ("%getDevices%") do set selectDevices=%%i

:main
cls
echo �����豸:%selectDevices%
echo ���Ŀ¼:%output%
echo Ŀ�����:%package%
echo 1.��ӡ.xml�ļ�
echo 2.����.db�ļ�
echo 3.�����ļ�
echo 4.�����ļ�
echo 5.ɾ���ļ�
echo 6.ɾ������
echo 7.�������
choice /c 12345 /n
goto :ff%ERRORLEVEL%

:ff1 (��ӡ.xml�ļ�)
call :getSelect xml file %LIST_FILE%
echo ��ӡ�ļ�:%file%
adb -s %selectDevices% shell cat %file%
echo -------------------end---------------
pause&goto:main

:ff2 (����.db�ļ�)
call :getSelect db file %LIST_FILE%
echo �����ļ�:%file%
adb -s %selectDevices%  pull %file% %output%
pause&goto:main

:ff3 (�����ļ�)
adb -s %selectDevices%  shell find %package% -type f >%lsfile%
call :select file %LIST_FILE%
echo �����ļ�:%file%
adb -s %selectDevices%  pull %file% %output%
pause&goto:main

:ff4 (�����ļ�)
adb -s %selectDevices%  shell find %package% -type d >%lsfile%
call :select selectdir %LIST_DIR%
set /p file=%IMPORT_MESSAGE%
adb -s %selectDevices%  push %file% %selectdir%
pause&goto:main

:ff5 (ɾ���ļ�)
set /p filter=�ļ���׺
if "%filter%"=="" (
	set resilt=""
) else (
	set resilt=-name *.%filter%
)
adb -s %selectDevices%  shell find %package% -type f %resilt% >%lsfile%
set filter=
call :select file %LIST_FILE%
echo ɾ���ļ�:%file%
adb root
adb remount
adb -s %selectDevices% shell rm -f %file% %output%
pause&goto:main

:ff6 (�������)
echo ��ʱʵ��
pause&goto:main
:ff7 (�������)
adb -s %selectDevices% shell pm clear %package%
pause&goto:main
:getSelect
adb -s %selectDevices%  shell find %package% -type f -name '*.%1' >%lsfile%
call :select %2 %3&goto :eof

:select
echo -----------------�б�------------------
type %lsfile%|findstr /n "."
echo ---------------------------------------
for /f "tokens=1" %%i in ('type %lsfile%^|find /v "" /c') do set /a rows=%%i
(for /l %%i in (1,1,%rows%) do set /p row%%i=)<%lsfile%
if  "%rows%"=="0" (
	echo û���ļ�&pause&goto:main
)
if "%rows%"=="1" (
	set sel=1
) else (
	echo ���ڶ��%2,��ѡ��^(a=10,b=11...^)
	choice /c 123456789abcdefghijklmn /n
	set sel=!ERRORLEVEL!
)
set %1=!row%sel%!&goto :eof