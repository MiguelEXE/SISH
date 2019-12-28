set/p pac="Package name>"

if %pac%==con echo System use this variable. Cannot continue && goto bye3
if %pac%==aux echo Auxiliary system variable. Cannot continue && goto bye3

if not exist %pac%.7z echo Theres no package named "%pac%.7z". put it on SISH folder and run the command again. && goto bye3

call etc\mv.bat %pac%.7z tmp
call etc\apt\7zG.exe e -otmp tmp\%pac%.7z
call etc\cp.bat tmp\%pac%.bat etc
call etc\mv.bat tmp\%pac% etc
call etc\cp.bat tmp\*.* etc\%pac%

echo To make changes, SISH need to be restarted, restart? (Y/N)?
echo This dont restart your computer.
set/p res=">"
if %res%==y goto restart
if %res%==Y goto restart
if %res%==n goto bye3
if %res%==N goto bye3

:bye3