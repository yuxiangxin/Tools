echo off
:: 自动提交代码脚本 2020/02/23 v1.0
setlocal enabledelayedexpansion
:: DONOT EDIT
set WORK_CLEAN="nothing to commit, working tree clean"
set PULL_FAILED="Automatic merge failed"

set TEMP_FILE="%TEMP%\syncTemp.txt"

:: git根目录位置
set GIT_SRC_DIR=%cd%
set BRANCH_SRC=master

set commitMessage=

call :pullSrc
goto :stop

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

:preparePushDst
git -C %GIT_SRC_DIR% checkout %BRANCH_SRC%
git -C %GIT_SRC_DIR% status
git -C %GIT_SRC_DIR% add --all
goto :getCommit

:push
git -C %GIT_SRC_DIR% commit -m "%commitMessage%"
git -C %GIT_SRC_DIR% push origin %BRANCH_DST%
goto :stop

:getCommit
echo 请输入提交信息,git commit:
@set/p commitMessage= >nul
if "%commitMessage%" EQU "" (
	goto :getCommit
) else (
	goto :push
)


:stop
del /Q %TEMP_FILE% >nul
echo "请按任意键退出..."
pause >nul
exit