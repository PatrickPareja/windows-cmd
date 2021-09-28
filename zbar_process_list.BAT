@ECHO off
FOR /F "usebackq tokens=* delims=" %%L IN ("SOURCEPATH\listoffiles.txt") DO (
(zbarimg -q --raw %%L && ECHO ,%%~nxL) >> "DESTINATIONPATH\output.txt"
)
