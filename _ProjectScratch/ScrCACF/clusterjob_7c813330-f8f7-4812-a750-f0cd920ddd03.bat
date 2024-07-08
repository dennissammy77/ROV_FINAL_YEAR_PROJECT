@ECHO OFF
SETLOCAL
CHCP 65001
ECHO Job started on %COMPUTERNAME%
SET /A errno=0
ECHO ClusterSharedDirectory=C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF
IF NOT EXIST "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\." goto NOSTAGINGDIR
ECHO AWP_ROOT241=%AWP_ROOT241%
IF "%AWP_ROOT241%" == "" GOTO NOAWPROOTENV
IF NOT EXIST "%AWP_ROOT241%\." goto NOAWPROOTDIR
ECHO Command=%AWP_ROOT241%/commonfiles/CPython/3_10/winx64/Release/python/python.exe
IF NOT EXIST "%AWP_ROOT241%/commonfiles/CPython/3_10/winx64/Release/python/python.exe" goto NOCOMMAND
ECHO running the commmand
ECHO command: "%AWP_ROOT241%/commonfiles/CPython/3_10/winx64/Release/python/python.exe" -B -E "%AWP_ROOT241%/RSM/Config/scripts/ClusterJobs.py" "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\control_7c813330-f8f7-4812-a750-f0cd920ddd03.rsm"
"%AWP_ROOT241%/commonfiles/CPython/3_10/winx64/Release/python/python.exe" -B -E "%AWP_ROOT241%/RSM/Config/scripts/ClusterJobs.py" "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\control_7c813330-f8f7-4812-a750-f0cd920ddd03.rsm"
IF %ERRORLEVEL% NEQ 0 SET /A errno=%ERRORLEVEL%
GOTO END
:NOAWPROOTENV
ECHO The AWP_ROOT241 environment variable was NOT detected.
ECHO 1000 > "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\exitcode_7c813330-f8f7-4812-a750-f0cd920ddd03.rsmout"
SET /A errno=1000
GOTO END
:NOCOMMAND
ECHO Command was NOT detected on execution host.
ECHO 1007 > "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\exitcode_7c813330-f8f7-4812-a750-f0cd920ddd03.rsmout"
SET /A errno=1007
GOTO END
:NOSTAGINGDIR
ECHO Shared cluster directory does not exist on execution node, make sure it is shared and can be accessed from all nodes.
ECHO 1008 > "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\exitcode_7c813330-f8f7-4812-a750-f0cd920ddd03.rsmout"
SET /A errno=1008
GOTO END
:NOAWPROOTDIR
ECHO AWP_ROOT241 directory does not exist on execution host.
ECHO 1009 > "C:\Users\Hp\Desktop\ROV\_ProjectScratch\ScrCACF\exitcode_7c813330-f8f7-4812-a750-f0cd920ddd03.rsmout"
SET /A errno=1009
GOTO END
:END
EXIT /B %errno%
