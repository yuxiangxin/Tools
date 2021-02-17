set ip=%1
if "%ip%" EQU "" (
	set ip=17
)
adb connect 192.168.0.%ip%
pause
