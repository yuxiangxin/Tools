@echo off
::����֧�֡����ⷴ����xin3283@qq.com
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if "%1" EQU "" goto :Main
if %1 LEQ 11 (
	goto :ff%1
) else (
	goto :isRunnian
)
:Main
exit /b 1
if exist %filePath% 1 0>%filePath% 2>nul
choice /c 1234567e /n
if "%errorlevel%" EQU "8" exit /b 0
goto ff%errorlevel%

:ff1
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /p file=
set /a cl=0
for /f "tokens=1 delims=." %%i in ("%file%") do set Newfile=%%i
for %%i in (doc docx xls xlsx ppt pptx txt jpg gif png rar zip pdf bmp) do (
	copy /y %file% %Newfile%.%%i 1>nul 2>nul&&set /a cl=cl+1
)
if "%errorlevel%" EQU "0" (
	echo �ѳɹ�����/�滻%cl%���ļ�
) else (
	exit /b 7
)
exit /b 0


:ff (δ����)
::���ݹؼ��ֲ����ļ���Ŀ¼���޷����ҳ���"&"���ļ���Ŀ¼:
set /p key=�ؼ���(���ܴ��� �ո�"&"):
echo ������....
for %%i in ( a b c d e g f h i j k l m n o p q r s t u v w x y z ) do (	
	if exist %%i: (	
		dir %%i: /s /b |findstr "%key%" 1>>%filePath%
	)
)
type %filePath%
clip < %filePath% 

echo ������ɡ�

:ff2
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /p key=
if "%key%"=="ECHO ���ڴ�״̬��" exit /b 7
set /p=������<nul
for %%i in ( a b c d e g f h i j k l m n o p q r s t u v w x y z ) do (	
	if exist %%i: (
		cd \
		%%i: 2>nul 
		dir /s /b "*%key%*" 1>>%filePath% 2>nul
		set /p=.<nul
	)
)
echo .
set /p va=<%filePath%
if "%va%" EQU "" exit /b 7
type %filePath%
clip < %filePath% 
exit /b 0

:ff8
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /p key=
if "%key%"=="ECHO ���ڴ�״̬��" exit /b 7
set /p=������<nul
for %%i in ( a b c d e g f h i j k l m n o p q r s t u v w x y z ) do (	
	if exist %%i: (
		cd \
		%%i: 2>nul 
		dir /s /b "%key%" 1>>%filePath% 2>nul
		set /p=.<nul
	)
)
echo .
set /p va=<%filePath%
if "%va%" EQU "" exit /b 7
type %filePath%
clip < %filePath% 
exit /b 0

:ff3
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /p file=
if "%file%"=="ECHO ���ڴ�״̬��" exit /b 7
if not exist "%file%" (
	echo %file% 1>%temp%\yut.txt
	set file=%temp%\yut.txt
)
(for /l %%i in (1,1,100) do set /p var%%i=)<%file%
for /l %%i in (1,1,100) do (
	for %%i in (!var%%i!) do set /p='%%i', 0>nul 1>>%filePath%
)
type %filePath%
clip < %filePath% 
exit /b 0

:ff4
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /p file=
if "%file%"=="ECHO ���ڴ�״̬��" exit /b 7
if not exist "%file%" (
	echo %file% 1>%temp%\yut.txt
	set file=%temp%\yut.txt
)
(for /l %%i in (1,1,100) do set /p var%%i=)<%file%
for /l %%i in (1,1,100) do (
	for %%i in (!var%%i!) do echo %%i 1>>%filePath%
)
type %filePath%
clip < %filePath% 
exit /b 0

:ff5
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /p file=
if not exist "%file%" exit /b 7
(for /l %%i in (1,1,100) do set /p h%%i=)<%file%
for /l %%a in (1,1,100) do (
	for %%i in (!h%%a!) do (
		set /p=%%i 0>nul 1>>%filePath%
	)
)
type %filePath%
clip < %filePath% 
exit /b 0

:ff6
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
:: �޳��ַ�
set /p t=�ַ����ı�:
if "%t%"=="" exit /b 7
set /p char=Ҫ�޳����ı�:
if not exist "%t%" set t="%t%"
>>%filePath% echo ----�޿ո�----
for /f "tokens=1-30 delims=%char% " %%a in (%t%)do (
	>>%filePath% echo %%a%%b%%c%%d%%e%%f%%g%%h%%i%%j%%k%%l%%m%%n%%o%%p%%q%%r%%s%%t%%u%%v%%w%%x%%y%%z
)
>>%filePath% echo ----�пո�----
for /f "tokens=1-30 delims=%char% " %%a in (%t%)do (
	>>%filePath% echo %%a %%b %%c %%d %%e %%f %%g %%h %%i %%j %%k %%l %%m %%n %%o %%p %%q %%r %%s %%t %%u %%v %%w %%x %%y %%z 
)

type %filePath%
clip < %filePath% 
exit /b 0

:ff7
set filePath=%temp%\test1.txt
setlocal enabledelayedexpansion
if exist %filePath% 1 0>%filePath% 2>nul
set /a long=0
set /p m=
if "%m%"=="ECHO ���ڴ�״̬��" exit /b 7
::��ȡû�и�ʽ������
for /f "tokens=1-3 delims=/-" %%i in ("%m%") do (
	set dd=%%i%%j%%k
)
::��ȡ���ڵĳ���
for /l %%i in (0,1,10) do (
	if "!m:~%%i,1!" NEQ "" set /a long=long+1
)
if "%long%" NEQ "10" (
	if "%long%" NEQ "8" (
		exit /b 8
	)
)
call :isRunnian
set a=%errorlevel%
::����·�С��10����ȡ��λ�·ݣ�else ȡ2λ�·�
if "%dd:~4,1%" EQU "0" (
	set /a mm=%dd:~5,1%
) else (
	set /a mm=%dd:~4,2%
)
::echo �·�mm:%mm%
::pause
if %mm% EQU 2 (
	if %a% EQU 1 (
		set /a tian=29 
	) else (
		set /a tian=28 
	)
	goto :output
)
::����·���4 6 9 11����30��else 31
(echo %mm% |findstr "4 6 9 11"&& set /a tian=30 || set /a tian=31) 1>nul
:output
::bat��ģ������ %% 
::set /a b=%long% %% 2
::if %b% NEQ 0 exit /b 8

if %long% EQU 10 (
	set join=%m:~4,1%
) else (
	set join=
)
::�����С��10����ȡ��λ�գ�else ȡ2λ��
if "%dd:~-2,1%" EQU "0" (
	set /a be=%dd:~-1,1%
) else (
	set /a be=%dd:~-2,2%
)
for /l %%i in (%be%,1,%tian%) do (
	if %%i LSS 10 (
		set /p='%dd:~-0,4%%join%%dd:~-4,2%%join%0%%i', 0<nul
	)else ( 
		set /p='%dd:~-0,4%%join%%dd:~-4,2%%join%%%i', 0<nul
	)
)>>%filePath%
type %filePath%
clip < %filePath% 
exit /b 0

:isRunnian
::�ж��Ǵ��Ǹ���ڽ�����
if "%1" NEQ "" (
	set /a yy=%1
) else (
	set /a yy=%dd:~-0,4%
)
::�ж��Ƿ������꣬��������꣬�򷵻� code=1,����0
set /a s1=0,y1=-99,y2=-99,y3=-99
set /a y1=yy %% 4
set /a y2=yy %% 100
set /a y3=yy %% 400 
if !y1! EQU 0 ( set /a s1=s1+1)
if !y2! NEQ 0 ( set /a s1=s1+1)
if !y3! EQU 0 ( set /a s1=s1+999)
if %s1% GTR 1 ( 
	exit /b 1
)	else (
	exit /b 0
)
exit /b

:ff9
set filePath=%temp%\test1.txt
if exist %filePath% 1 0>%filePath% 2>nul
set /p char=
if not exist "%char%" set char="%char%"
for /f "tokens=1-30 delims=��" %%a in (%char%) do (
	if not "%%a"=="" >>%filePath% echo %%a
	if not "%%b"=="" >>%filePath% echo %%b
	if not "%%c"=="" >>%filePath% echo %%c
	if not "%%d"=="" >>%filePath% echo %%d
	if not "%%e"=="" >>%filePath% echo %%e
	if not "%%f"=="" >>%filePath% echo %%f
	if not "%%g"=="" >>%filePath% echo %%g
	if not "%%h"=="" >>%filePath% echo %%h
	if not "%%i"=="" >>%filePath% echo %%i
	if not "%%j"=="" >>%filePath% echo %%j
	if not "%%k"=="" >>%filePath% echo %%k
	if not "%%l"=="" >>%filePath% echo %%l
	if not "%%m"=="" >>%filePath% echo %%m
	if not "%%n"=="" >>%filePath% echo %%n
	if not "%%o"=="" >>%filePath% echo %%o
	if not "%%p"=="" >>%filePath% echo %%p
	if not "%%q"=="" >>%filePath% echo %%q
	if not "%%r"=="" >>%filePath% echo %%r
	if not "%%s"=="" >>%filePath% echo %%s
	if not "%%t"=="" >>%filePath% echo %%t
	if not "%%u"=="" >>%filePath% echo %%u
	if not "%%v"=="" >>%filePath% echo %%v
	if not "%%w"=="" >>%filePath% echo %%w
	if not "%%x"=="" >>%filePath% echo %%x
	if not "%%y"=="" >>%filePath% echo %%y
	if not "%%z"=="" >>%filePath% echo %%z

)

type %filePath%
clip < %filePath% 
exit /b 0
)
:ff10
@echo off&setlocal enabledelayedexpansion
::2015��12��30��21:51:35
if "%~2"=="" exit /b 7
set cut=\\
if not "%3"=="" set cut=/
set uploadFile=%~2
for /f "tokens=1-18 delims=\" %%i in ("%uploadFile%") do (
	set uploadFile=%%i%cut%%%j%cut%%%k%cut%%%l%cut%%%m%cut%%%n%cut%%%o%cut%%%p%cut%%%q%cut%%%r%cut%%%s%cut%%%t%cut%%%u%cut%%%u%cut%%%w%cut%%%x%cut%%%y%cut%%%z
)
:reSub
set uploadFile=%uploadFile:~0,-1%
if "%uploadFile:~-1%"=="%cut:~-1%" goto :reSub
echo %uploadFile%
echo %uploadFile% > %filePath%
clip < %filePath% 
exit /b 0

