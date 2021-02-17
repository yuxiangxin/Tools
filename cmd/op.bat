@echo off
if not exist %SystemRoot%\system32\choice.exe (echo 系统缺少运行必须组件choice.exe，请联系xin3283@qq.com。&pause>nul&exit /b 2)
if "%1" EQU "/?" (
	type %~dp0\opcomdhelp
) 	else if "%1" EQU "/C" (
	echo %2|mlxin 1
	goto :runCode
)	else if "%1" EQU "/F" (
	echo %2|mlxin 2
	goto :runCode
)	else if "%1" EQU "/F:1" (
	echo %2|mlxin 2
	goto :runCode
)	else if "%1" EQU "/F:0" (
	echo %2|mlxin 8
	goto :runCode
)	else if "%1" EQU "/J" (
	echo %2 %3 %4 %5 %6 %7 %8 %9|mlxin 3
	goto :runCode
)	else if "%1" EQU "/H" (
	echo %2 %3 %4 %5 %6 %7 %8 %9|mlxin 4
	goto :runCode
)	else if "%1" EQU "/T" (
	echo %2|mlxin 5
	goto :runCode
)	else if "%1" EQU "/Q" (
	call mlxin 6
	goto :runCode
)	else if "%1" EQU "/L" (
	echo %2|mlxin 7
	goto :runCode
)	else if "%1" EQU "/c" (
	echo %2|mlxin 1
	goto :runCode
)	else if "%1" EQU "/f" (
	echo %2|mlxin 2
	goto :runCode
)	else if "%1" EQU "/f:1" (
	echo %2|mlxin 2
	goto :runCode
)	else if "%1" EQU "/f:0" (
	echo %2|mlxin 8
	goto :runCode
)	else if "%1" EQU "/j" (
	echo %2 %3 %4 %5 %6 %7 %8 %9|mlxin 3
	goto :runCode
)	else if "%1" EQU "/h" (
	echo %2 %3 %4 %5 %6 %7 %8 %9|mlxin 4
	goto :runCode
)	else if "%1" EQU "/t" (
	echo %2|mlxin 5
	goto :runCode
)	else if "%1" EQU "/q" (
	call mlxin 6
	goto :runCode
)	else if "%1" EQU "/l" (
	echo %2|mlxin 7
	goto :runCode
)	else if "%1" EQU "/y" (
	echo %2|mlxin 9
	goto :runCode
)	else if "%1" EQU "/s" (
	call mlxin 10 %2 %3
	goto :runCode
)	else if "%1" EQU "/S" (
	call mlxin 10 %2 %3
	goto :runCode
)	else (
	echo 命令语法不正确。
	echo 键入 "op /?" 以了解用法。
)
:runCode
if "%errorlevel%"=="7" (
	echo 未获取到输入信息或文件路径错误
) else if "%errorlevel%"=="8" (
	echo 日期格式输入错误
)
exit /b


