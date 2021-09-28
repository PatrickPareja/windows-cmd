@ECHO off
SETLOCAL

ECHO This will prompt for folder paths and run ROBOCOPY with subfoldering and logging.
ECHO:
ECHO NOTES
ECHO -Ensure quotes are NOT included in paths. Right-click to paste clipboard contents.
ECHO -Edit your desired switches as needed on line 35 of this batch file.
ECHO: 
PAUSE
CLS

rem Prompt user for source directory to copy files.
ECHO 1. Specify the source path containing all files and folders to be copied.
ECHO ------------------------------------------------------------------------------
SET /P src_dir=
ECHO: 
ECHO ------------------------------------------------------------------------------

rem Prompt user for destination directory to copy files to.
ECHO 2. Specify the destination path of where those items will be copied to.
ECHO ------------------------------------------------------------------------------
SET /P dest_dir=
ECHO: 
ECHO ------------------------------------------------------------------------------

rem Prompt for reporting folder then append log name to directory.
ECHO 3. Specify the log output file (PATH\filename.LOG).
ECHO ------------------------------------------------------------------------------
SET /P log_dirfile=
ECHO: 
ECHO ------------------------------------------------------------------------------

rem ************************** ! EDIT SWITCHES HERE ! *****************************
SET switches_wlog=/E /R:2 /W:1 /MT:8 /TEE /LOG:
rem *******************************************************************************

rem Display user inputs and prompt to begin copy.
CLS
ECHO                                  -INPUTS-
ECHO ------------------------------------------------------------------------------
ECHO SOURCE      : %src_dir%
ECHO: 
ECHO DESTINATION : %dest_dir%
ECHO: 
ECHO LOG OUTPUT  : %log_dirfile%
ECHO:
ECHO ------------------------------------------------------------------------------
ECHO OPTIONS     : %switches_wlog%
ECHO ------------------------------------------------------------------------------
ECHO: 
ECHO If inputs are correct, press any key to start robocopy, if incorrect, please
PAUSE>NUL | SET /P =close this window and re-run bat . . .
CLS

rem ****************************** robocopy string ********************************
ROBOCOPY "%src_dir%" "%dest_dir%" %switches_wlog%"%log_dirfile%"
rem *******************************************************************************

ECHO ------------------------------------------------------------------------------
ECHO PROCESS COMPLETED! 
ECHO: 
ECHO *One skipped directory may be reported, this is likely not an error as robocopy
ECHO may have looped back to the root path and skipped it since it was already copied.
ECHO: 
PAUSE>NUL | SET /P =Press any key to exit . . .
ENDLOCAL