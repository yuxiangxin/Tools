echo off
:: 2��git�ֿ����ͬ�� 2020/01/22 v1.0
setlocal enabledelayedexpansion
::���޸� start
set WORK_CLEAN="nothing to commit, working tree clean"
set PULL_FAILED="Automatic merge failed"
set GIT_TEMP_RENAME=.temp
set GIT_NAME=.git
::���޸� end

set TEMP_FILE="%TEMP%\syncTemp.txt"

::ͬ����git��Ŀ¼
set GIT_DST_DIR=C:\Users\Administrator\Desktop\temp2\testSync\synctest
::ͬ��Դgit��Ŀ¼
set GIT_SRC_DIR=C:\Users\Administrator\Desktop\temp2\testSync\synctest\L3\cropdemo

set BRANCH_SRC=master
set BRANCH_DST=master

set commitMessage=

call :checkState %GIT_DST_DIR% 0
goto :stop

echo ":targetGit"
:checkState targetGit
set targetGit=%1%
echo ���git���ر仯��Ϣ,%targetGit%
git -C %targetGit% status | findstr /C:%WORK_CLEAN% >%TEMP_FILE%
set /p stats=<%TEMP_FILE%
if "%stats%" EQU "" (
	echo %targetGit%,���ش��ڱ��,��Ҫ�Ⱥϲ�
	goto :stop
) else (
	if %2% EQU 1 (
		goto :pullSrc
	) else (
		call :checkState %GIT_SRC_DIR% 1
	)
)

echo ":pullSrc"
:pullSrc 
git -C %GIT_SRC_DIR% checkout %BRANCH_SRC%
git -C %GIT_SRC_DIR% pull origin %BRANCH_SRC% | findstr /C:%PULL_FAILED% >%TEMP_FILE%
set /p pullState=<%TEMP_FILE%
if "%pullState%" EQU "" (
	goto :preparePushDst
) else (
	echo %GIT_SRC_DIR%,�Զ��ϲ�ʧ��,������ͻ������!
	goto :stop
)

echo ":preparePushDst"
:preparePushDst
attrib -h "%GIT_SRC_DIR%\%GIT_NAME%"
rename "%GIT_SRC_DIR%\%GIT_NAME%" "%GIT_TEMP_RENAME%" >nul
git -C %GIT_DST_DIR% checkout %BRANCH_DST%
git -C %GIT_DST_DIR% status
git -C %GIT_DST_DIR% add --all
goto :getCommit

:pushDst
git -C %GIT_DST_DIR% commit -m "%commitMessage%"
git -C %GIT_DST_DIR% push origin %BRANCH_DST%
goto :stop

echo ":getCommit"
:getCommit
echo �������ύ��Ϣ,git commit:
@set/p commitMessage= >nul
if "%commitMessage%" EQU "" (
	goto :getCommit
) else (
	goto :pushDst
)


:stop
del /Q %TEMP_FILE% >nul
echo :stop
if exist "%GIT_SRC_DIR%\%GIT_TEMP_RENAME%" (
	rename "%GIT_SRC_DIR%\%GIT_TEMP_RENAME%" "%GIT_NAME%" >nul	
	attrib +h "%GIT_SRC_DIR%\%GIT_NAME%"
)
echo "�밴������˳�..."
pause >nul
exit