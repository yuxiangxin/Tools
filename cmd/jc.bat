@echo off&set startTime=%time%
call :run %1
call :time0 %startTime% %time% t
echo.
set /p=------------ %t% ------------<nul
exit /b 0
rem 制作时间2015年10月23日 xin3283@qq.com
rem 用途：将当前目录下的java文件编译并执行
:run
if "%1"=="1" copy /y %~f0 %SystemRoot%
set jclog=%temp%\javac.log
if exist %jclog% 1 0>%jclog% 2>nul
javac *.java 2>%jclog%
(for /f "skip=6 tokens=2 delims=个文件 " %%i in ('dir  /-c %jclog%') do @echo %%i|findstr /v "目录") >%temp%\jcSize.txt
set /p size=<%temp%\jcSize.txt
if not "%size%"=="0" (
	type %jclog%
	exit /b 1
)
setlocal enabledelayedexpansion
set /a MainSum=1
	for %%a in (*.java) do (
		type %%a|findstr /i "main" && ( set main!MainSum!=%%a & set /a MainSum+=1)
	)>nul
set /a MainSum=MainSum-1
for /l %%a in (1,1,%MainSum%) do (
	set main%%a=!main%%a:~0,-6!
)
if "%MainSum%"=="0" (
	echo 找不到主类
	exit /b 2
) else if "%MainSum%"=="1" (
	echo %main1%.java
	java %main1%
	exit /b 0
)
echo 存在以下主函数，选择

for /l %%i in (1,1,%MainSum%) do echo %%i:!main%%i!.java
choice /c 123456789 /n
echo !main%errorlevel%!.java
java !main%errorlevel%!
exit /b 0

:time0 计算时间差 （封装）
@echo off&setlocal&set /a n=0&rem code 随风 @bbs.bathome.cn
for /f "tokens=1-8 delims=.: " %%a in ("%~1:%~2") do (
	set /a n+=10%%a%%100*360000+10%%b%%100*6000+10%%c%%100*100+10%%d%%100
	set /a n-=10%%e%%100*360000+10%%f%%100*6000+10%%g%%100*100+10%%h%%100
)
set /a s=n/360000,n=n%%360000,f=n/6000,n=n%%6000,m=n/100,n=n%%100
set "ok=%s% 小时 %f% 分钟 %m% 秒 %n% 毫秒"
endlocal&set %~3=%ok:-=%&goto :EOF