@echo off
set jarSrc=E:\软件开发工具\eclipse插件\set\jadEclipse4.jar
set tarPath="C:\MySoftWare\Work\android-adt-bundle\eclipse\plugins\jadEclipse4.jar"
if not exist %tarPath% (copy %jarSrc% %tarPath% )&echo 已复制jra包纸色eclipse &pause&exit
del %tarPath%
echo 已删除jar包
pause