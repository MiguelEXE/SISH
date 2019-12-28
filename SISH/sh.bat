@echo off
if not exist etc goto error
if not exist tmp goto error
set path=etc;%windir%
if not exist verify.bat goto error
call verify.bat
cd ..
cls
echo Welcome %username%
echo to exit type goto bye
echo dont execute "cd tmp" or "cd etc"
echo to install a pacakge, run: "apt" and put a package name.
echo to install packages you need 64 bits machine.
echo.
echo If you wanna go to DOS mode (Temporary Command Prompt), type dos
echo.
:sh
set/p ir="~>"
call %ir%
echo.
goto sh
:bye
del /s /q tmp\*
goto b
:restart
echo Restarting...
del /s /q tmp\* > nul
start sh.bat
exit
:error
echo Dont exist files to execute SISH, press any key to exit...
pause > nul
:b
cls