@echo off
set jarSrc=E:\�����������\eclipse���\set\jadEclipse4.jar
set tarPath="C:\MySoftWare\Work\android-adt-bundle\eclipse\plugins\jadEclipse4.jar"
if not exist %tarPath% (copy %jarSrc% %tarPath% )&echo �Ѹ���jra��ֽɫeclipse &pause&exit
del %tarPath%
echo ��ɾ��jar��
pause