echo off
:: 2个git仓库代码同步 2020/01/22 v1.0
setlocal enabledelayedexpansion
::勿修改 start
set WORK_CLEAN="nothing to commit, working tree clean"
set PULL_FAILED="Automatic merge failed"
set GIT_TEMP_RENAME=.temp
set GIT_NAME=.git
::勿修改 end

set TEMP_FILE="%TEMP%\syncTemp.txt"

::同步至git根目录
set GIT_DST_DIR=C:\Users\Administrator\Desktop\temp2\testSync\synctest
::同步源git根目录
set GIT_SRC_DIR=C:\Users\Administrator\Desktop\temp2\testSync\synctest\L3\cropdemo

set BRANCH_SRC=master
set BRANCH_DST=master

set commitMessage=

call :checkState %GIT_DST_DIR% 0
goto :stop

echo ":targetGit"
:checkState targetGit
set targetGit=%1%
echo 检查git本地变化信息,%targetGit%
git -C %targetGit% status | findstr /C:%WORK_CLEAN% >%TEMP_FILE%
set /p stats=<%TEMP_FILE%
if "%stats%" EQU "" (
	echo %targetGit%,本地存在变更,需要先合并
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
	echo %GIT_SRC_DIR%,自动合并失败,请解决冲突后重试!
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
echo 请输入提交信息,git commit:
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
echo "请按任意键退出..."
pause >nul
exit