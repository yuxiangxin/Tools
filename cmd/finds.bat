@echo off
REM ������ǰĿ¼��ָ�������ı��ļ�,���Ϲؼ��ֵ��ļ�,�ҵ���ͣ
REM Created by Yu xiangxin on 2016/5/23
if "%2"=="" (
	echo �÷�ʾ��:������ǰĿ¼�°���main�ؼ��ֵ�java�ļ�^(�����ִ�Сд^) 
	echo %~n0 java main 
	exit /b 1
)
for /r %%a in (*.%1) do (type %%a|findstr /i /n "%2" && (echo �ҵ�:%%a&pause))
exit /b 0