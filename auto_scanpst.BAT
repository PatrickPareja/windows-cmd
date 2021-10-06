@ECHO off
SETLOCAL

ECHO This will initiate the ScanPST tool to run until it reaches a Steady state where the PST file
ECHO is fully repaired without errors, or until a set amount of passes (8) have completed.
ECHO: 
PAUSE
CLS

rem Prompt user for source PST file to repair.
ECHO Specify the Source PST file to repair - include the full path in quotes. (Right-click to paste)
ECHO -------------------------------------------------------------------------------------
SET /P source_pst=
ECHO: 
ECHO -------------------------------------------------------------------------------------

rem ***************************** ! EDIT SWITCHES HERE ! ********************************
SET switches_wlog=-force -rescan 8 -log replace
rem *************************************************************************************

rem Set LOG output directory.
SET log_output=%source_pst:.pst"=.log"%

rem Display user inputs and prompt to start ScanPST tool.
CLS
ECHO                                    -INPUTS-
ECHO -------------------------------------------------------------------------------------
ECHO:
ECHO SOURCE PST : %source_pst%
ECHO LOG OUTPUT : %log_output%
ECHO:
ECHO -------------------------------------------------------------------------------------
ECHO OPTIONS    : -file [SOURCE PST] -force -rescan 8 -log replace [LOG OUTPUT]
ECHO -------------------------------------------------------------------------------------
ECHO: 
ECHO If inputs are correct, press any key to launch ScanPST and begin file repair.
PAUSE>NUL | SET /P =If incorrect, close this window and re-run bat . . .
CLS
ECHO ScanPST in progress, this window will close once the process has completed.

rem ******************************* Scanpst.exe command *********************************
"C:\Program Files\Microsoft Office\root\Office16\SCANPST.EXE" -file %source_pst% %switches_wlog% %log_output%
rem *************************************************************************************

ENDLOCAL
EXIT
