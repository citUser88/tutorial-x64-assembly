@ECHO OFF

ml64 HelloWorld.asm /link /subsystem:windows

choice /T 3 /D N /M "Following assmbly/linking creation of EXE file, delete intermediaries (timeout=N)?"
if %ERRORLEVEL%==2 goto fin

del HelloWorld.obj *.lnk>nul 2>&1

:fin

@ECHO ON