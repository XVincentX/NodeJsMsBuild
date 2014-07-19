@echo off
 if \{%1\}==\{\} @echo Syntax: DelFolder FolderPath&goto :EOF
 if not exist %1 @echo Syntax: DelFolder FolderPath - %1 NOT found.&goto :EOF
 setlocal
 set folder=%1
 set MT="%TEMP%\DelFolder_%RANDOM%"
 MD %MT%
 RoboCopy %MT% %folder% /MIR
 RD /S /Q %MT%
 RD /S /Q %folder%
 endlocal
