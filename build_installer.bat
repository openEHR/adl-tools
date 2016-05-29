set PYPATH=C:\Program Files (x86)\python2.7
set PLATFORM=win32
set ISE_C_COMPILER=mingw

set PATH=c:\program files\nsis;C:\Program Files\Git\cmd;C:\Program Files\Git\bin;C:\Program Files (x86)\NSIS;%PATH%
set PATH=%PYPATH%;%PYPATH%\Scripts;%PATH%

scons ..\downloads\windows\adl_workbench


