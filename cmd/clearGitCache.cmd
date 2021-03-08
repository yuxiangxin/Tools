:: 清除git工作区缓存脚本, 但需手动提交一次代码才能运行
@echo off
set workDir=%cd%

echo 检查git本地修改信息,%workDir%
for /f %%i in ('git -C %workDir% status ^|findstr /C:"nothing to commit, working tree clean"') do call :clear&exit
echo 命令未执行, 本地存在变更, 请手动提交后重试.
pause&exit /b 1

:clear
echo Start clear git cached.
for /f "delims=* " %%i in ('git -C %workDir% branch') do set branch=%%i
git -C %workDir% rm -r --cached .
git -C %workDir% add .
git -C %workDir% commit -m "clear git cached"
git -C %workDir% push origin %branch%
pause&exit /b 0