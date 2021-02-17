@echo off
REM 遍历当前目录下指定类型文本文件,符合关键字的文件,找到暂停
REM Created by Yu xiangxin on 2016/5/23
if "%2"=="" (
	echo 用法示例:遍历当前目录下包含main关键字的java文件^(不区分大小写^) 
	echo %~n0 java main 
	exit /b 1
)
for /r %%a in (*.%1) do (type %%a|findstr /i /n "%2" && (echo 找到:%%a&pause))
exit /b 0