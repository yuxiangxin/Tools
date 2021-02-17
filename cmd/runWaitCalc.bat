@echo off&set /a count=60
:re
ping /w 1000 /n 1 10.99.99.9 >nul&set /a count-=1
cls&echo 下次可回复倒计时:%count%
if "%count%" GTR "0" goto :re
exit /b 0
