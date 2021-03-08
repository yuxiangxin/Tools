:: ���git����������ű�, �����ֶ��ύһ�δ����������
@echo off
set workDir=%cd%

echo ���git�����޸���Ϣ,%workDir%
for /f %%i in ('git -C %workDir% status ^|findstr /C:"nothing to commit, working tree clean"') do call :clear&exit
echo ����δִ��, ���ش��ڱ��, ���ֶ��ύ������.
pause&exit /b 1

:clear
echo Start clear git cached.
for /f "delims=* " %%i in ('git -C %workDir% branch') do set branch=%%i
git -C %workDir% rm -r --cached .
git -C %workDir% add .
git -C %workDir% commit -m "clear git cached"
git -C %workDir% push origin %branch%
pause&exit /b 0